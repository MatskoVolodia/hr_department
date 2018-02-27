class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  decorates_assigned :post

  def index
    @posts = Post.all.paginate(pagination_params)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    render :new unless @post.save

    redirect_to @post, notice: t('notices.created', item: Post.name)
  end

  def update
    render :edit unless @post.update(post_params)

    redirect_to @post, notice: t('notices.updated', item: Post.name)
  end

  def destroy
    @post.destroy

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
end
