class UserGroupsController < ApplicationController
  before_action :set_user_group,        only: %i[show edit update destroy]
  before_action :create_new_user_group, only: %i[index]

  decorates_assigned :user_group
  decorates_assigned :users

  load_and_authorize_resource

  def index
    @facade = UserGroups::IndexFacade.new(params.merge(pagination_params: pagination_params))
  end

  def create
    @user_group = UserGroups::Create.call(params: user_group_params)

    render :new and return unless @user_group.persisted?

    redirect_to user_groups_url, notice: t('notices.created', item: UserGroup.name)
  end

  def update
    render :edit unless @user_group.update(user_group_params)

    redirect_to @user_group, notice: t('notices.updated', item: UserGroup.name)
  end

  def destroy
    Shared::Destroy.call(item: @user_group)

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
    params.require(:user_group).permit(
      :group_name,
      post_ids: [],
      user_ids: []
    )
  end
end
