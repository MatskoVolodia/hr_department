class UserGroupsController < ApplicationController
  before_action :set_user_group,        only: %i[show edit update destroy]
  before_action :create_new_user_group, only: %i[index]

  def index
    @user_groups = UserGroup.all
  end

  def create
    @user_group = UserGroup.new(user_group_params)

    render :new and return unless @user_group.save

    redirect_to @user_group, notice: 'User group was successfully created.'
  end

  def update
    render :edit unless @user_group.update(user_group_params)

    redirect_to @user_group, notice: t('notices.created', item: UserGroup.name)
  end

  def destroy
    @user_group.destroy

    redirect_to user_groups_url, notice: t('notices.destroyed', item: UserGroup.name)
  end

  private

  def set_user_group
    @user_group = UserGroup.find(params[:id])
  end

  def create_new_user_group
    @user_group = UserGroup.new
  end

  def user_group_params
    params.require(:user_group).permit(:name)
  end
end