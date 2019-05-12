class ConfirmationMailer < ApplicationMailer
  def confirmation_mail(feed)
    @feed = feed
    mail to: @feed.author_email, subject: "投稿確認メール"
  end
end
