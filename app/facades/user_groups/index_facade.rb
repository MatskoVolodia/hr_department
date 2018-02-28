module UserGroups
  class IndexFacade
    def initialize(params = {})
      @params = params
    end

    def user_groups
      @user_groups ||= find_user_groups
    end

    def ransack_q
      @ransack_q ||= UserGroup.ransack(params[:q])
    end

    private

    attr_reader :params

    def user_id
      params[:user_id]
    end

    def post_id
      params[:post_id]
    end

    def pagination_params
      params[:pagination_params]
    end

    def find_user_groups
      return User.find_by(id: user_id) if user_id
      return Post.find_by(id: post_id) if post_id

      ransack_q.result.paginate(pagination_params)
    end
  end
end