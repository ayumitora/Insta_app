class ConfirmationMailer < ApplicationMailer
  def confirmation_mail(feed)
    @feed = feed
    @user = User.find(feed.user_id)
    mail to: @user.email, subject: "投稿確認メール"
  end
end
