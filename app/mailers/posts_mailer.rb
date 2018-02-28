class PostsMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def new_post_mail(post, recipient)
    @post = post.decorate

    mail(
      to:      recipient,
      subject: t('mailers.posts.new_post_subject')
    )
  end
end
