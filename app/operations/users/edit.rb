module Users
  class Edit < ::Callable
    def initialize(params = {})
      @user_id      = params[:user_id]
      @current_user = params[:current_user]
    end

    def call
      User.find_by(id: user_id) || current_user
    end

    private

    attr_reader :user_id, :current_user
  end
end
