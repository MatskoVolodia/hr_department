module Users
  class IndexFacade
    def initialize(params = {})
      @query             = params[:query]
      @pagination_params = params[:pagination_params]
    end

    def ransack_query
      @ransack_query ||= User.ransack(query)
    end

    def users
      @users ||= ransack_query
        .result
        .paginate(pagination_params)
    end

    private

    attr_reader :query, :pagination_params
  end
end
