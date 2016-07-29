class NotificationMailer < ApplicationMailer

	def account_activation_request_mail(user)
        @user = user
        mail :to => User.admin_users.map(&:email), :subject => "Information Box's account activation request"
    end

    def account_activation_or_deactivation_mail(user)
        @user = user
        mail :to => user.email, :subject => "Your Information Box's account has been #{@user.active? ? 'activated' : 'deactivated'}!"
    end

    def admin_privileges_toggle_notification(user)
        @user = user
        mail :to => user.email, :subject => "#{@user.admin? ? 'You have been granted administrator privileges' : 'Your administrator privileges has been revoked'}."
    end

    # def new_issue_notification(issue, recipient)
    #     @issue = issue
    #     @recipient = recipient
    #     mail :to => recipient.email, :subject => "#{issue.project.name.titleize} ##{issue.id}: #{issue.subject}"
    # end

    # def issue_updation_notification(issue, issue_changes, recipient)
    #     @issue = issue
    #     @recipient = recipient
    #     @issue_changes = issue_changes
    #     mail :to => recipient.email, :subject => "#{issue.project.name.titleize} ##{issue.id}: #{issue.subject}"
    # end
end
