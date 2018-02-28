class PostsController < ApplicationController
  before_action :set_post,        only: %i[show edit update destroy]
  before_action :prepare_params,  only: %i[create update]

  decorates_assigned :post

  load_and_authorize_resource

  impressionist actions: %i[show], unique: %i[user_id impressionable_id]

  def index
    @facade = Posts::IndexFacade.new(
      query:             params[:q],
      pagination_params: pagination_params,
      current_user:      current_user
    )
  end

  def show
    @facade = Posts::CoverageSummary.new(post: post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Posts::Create.call(params: post_params)

    render :new and return unless @post.persisted?

    redirect_to @post, notice: t('notices.created', item: Post.name)
  end

  def update
    render :edit unless @post.update(post_params)

    redirect_to @post, notice: t('notices.updated', item: Post.name)
  end

  def destroy
    Shared::Destroy.call(item: @post)

    redirect_to posts_url, notice: t('notices.destroyed', item: Post.name)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :picture,
      :attached_file,
      user_group_ids: []
    )
  end

  def prepare_params
    params[:post][:user_group_ids] ||= []
  end
end
