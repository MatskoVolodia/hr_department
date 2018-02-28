module Users
  class Create < ::Callable
    def initialize(params = {})
      @user_params = params[:user_params]
    end

    def call
      User.new(user_params).tap(&:save)
    end

    private

    attr_reader :user_params
  end
end