class ApprovalRequestMailer < ApplicationMailer
  def request_approval(user:, recipient:, request:, approval_request:)
    @user = user
    @recipient = recipient
    @request = request
    @approval_request = approval_request
    mail(to: @recipient.email, subject: 'New leave request(s)')
  end

  def request_revoked(recipient:, request:)
    @recipient = recipient
    @request = request
    mail(to: @recipient.email, subject: 'Leave revoked')
  end

  def request_successfully_revoked(user:, request:)
    @user = user
    @request = request
    mail(to: @user.email, subject: 'Request revoked')
  end
end
