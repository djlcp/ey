# Preview all emails at http://localhost:3000/rails/mailers/approval_request_mailer
class ApprovalRequestMailerPreview < ActionMailer::Preview
  def request_approval
    ApprovalRequestMailer.request_approval(
      user: User.new(first_name: 'Test', last_name: 'User'),
      recipient: User.new(first_name: 'Test', last_name: 'Manager', email: 'testmanager@email.com'),
      request: Request.new(
        description: 'description',
        leave_type: :annual_leave,
        start: Date.today,
        end: Date.today + 2.days
      ),
      approval_request: OpenStruct.new(token: 'randomtoken')
    )
  end
end
