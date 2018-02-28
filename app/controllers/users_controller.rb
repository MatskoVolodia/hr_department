class UsersController < ApplicationController
  before_action :set_user,        only: %i[update destroy]
  before_action :create_new_user, only: %i[index new]

  load_and_authorize_resource

  def index
    @facade = Users::IndexFacade.new(
      query: params[:q],
      pagination_params: pagination_params
    )
  end

  def edit
    set_user if params[:id]

    @user ||= current_user
  end

  def create
    @user = User.new(user_params)

    render :new and return unless @user.save

    redirect_to users_path, notice: t('notices.created', item: User.name)
  end

  def update
    render :edit and return unless @user.update(user_params)

    redirect_back fallback_location: root_path, notice: t('notices.updated', item: User.name)
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: t('notices.destroyed', item: User.name)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def create_new_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      user_group_ids: []
    )
  end
end
