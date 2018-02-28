module UserGroups
  class IndexFacade
    def initialize(params = {})
      @params            = params[:params]
      @pagination_params = params[:pagination_params]
    end

    def user_groups
      @user_groups ||= begin
        return User.find_by(id: user_id).user_groups if user_id
        return Post.find_by(id: post_id).user_groups if post_id

        ransack_query.result.paginate(pagination_params)
      end
    end

    def ransack_query
      @ransack_query ||= UserGroup.ransack(params[:q])
    end

    private

    attr_reader :params, :pagination_params

    %i[user_id post_id].each do |attribute|
      define_method(attribute) { params[attribute] }
    end
  end
end
