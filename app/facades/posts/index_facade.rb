module Posts
  class IndexFacade
    def initialize(params = {})
      @query             = params[:query]
      @pagination_params = params[:pagination_params]
      @current_user      = params[:current_user]
    end

    def ransack_q
      @ransack_q ||= Post.ransack(query)
    end

    def posts
      @posts ||= ransack_q.result.readable(current_user).paginate(pagination_params)
    end

    private

    attr_reader :query, :pagination_params, :current_user
  end
end
