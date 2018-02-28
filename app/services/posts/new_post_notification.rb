module Posts
  class NewPostNotification < ::Callable
    def initialize(params = {})
      @post = params[:post]
    end

    def call
      post.targets.each(&method(:send_mail))
    end

    private

    attr_reader :post

    def send_mail(target)
      PostsMailer.new_post_mail(post, target.email).deliver
    end
  end
end
