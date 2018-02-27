class UsersController < ApplicationController
  before_action :set_user,        only: %i[edit update destroy add_to_user_group]
  before_action :create_new_user, only: %i[index new]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.paginate(pagination_params)
  end

  def create
    @user = User.new(user_params)

    render :new and return unless @user.save

    redirect_to users_path, notice: t('notices.created', item: User.name)
  end

  def update
    redirect_to users_path and return if @user.update(user_params)

    redirect_to edit_user_path(@user), notice: t('notices.updated', User.name)
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: t('notices.destroyed', item: User.name)
  end

  def add_to_user_group
    if user_params[:user_group_ids]
      @user.user_groups << UserGroup.where(id: user_params[:user_group_ids])
    end

    redirect_back fallback_location: users_path
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
      :user_group_ids,
      user_group_ids: []
    )
  end
end
