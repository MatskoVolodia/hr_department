module Users
  class IndexFacade
    def initialize(params = {})
      @query             = params[:query]
      @pagination_params = params[:pagination_params]
    end

    def ransack_q
      @ransack_q ||= User.ransack(query)
    end

    def users
      @users ||= ransack_q.result.paginate(pagination_params)
    end

    private

    attr_reader :query, :pagination_params
  end
end
