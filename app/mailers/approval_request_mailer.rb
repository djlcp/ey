class ApprovalRequestMailer < ApplicationMailer
  def request_approval(user:, recipient:, request:, approval_request:)
    @user = user
    @recipient = recipient
    @request = request
    @approval_request = approval_request
    mail(to: @recipient.email, subject: 'New leave request(s)')
  end
end
