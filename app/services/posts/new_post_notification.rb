module Posts
  class NewPostNotification < ::Callable
    def initialize(params = {})
      @post = params[:post]
    end

    def call
      post.targets.each { |t| PostsMailer.new_post_mail(post, t.email).deliver }
    end

    private

    attr_reader :post
  end
end