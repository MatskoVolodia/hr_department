module Posts
  class IndexFacade
    def initialize(params = {})
      @query             = params[:query]
      @pagination_params = params[:pagination_params]
      @current_user      = params[:current_user]
    end

    def ransack_query
      @ransack_query ||= Post.ransack(query)
    end

    def posts
      @posts ||= ransack_query
        .result
        .readable(current_user)
        .paginate(pagination_params)
    end

    private

    attr_reader :query, :pagination_params, :current_user
  end
end
