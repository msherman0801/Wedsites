class InvitationsController < DashboardController
    before_action :require_website

    def index
        @invitation = Invitation.new
        @invitations = current_website.invitations.sort_by{|i| i.last_name }
    end

    def create
        invite = Invitation.create(invitation_params(:first_name, :last_name))
        current_website.invitations << invite
        redirect_to invitations_path
    end

    def show
        @invitation = Invitation.find_by(invitation_params(:id))
    end

    def delete
        id(Invitation).destroy
        redirect_to invitations_path
    end

    private

    def invitation_params(*args)
        params.permit(*args)
    end

end
