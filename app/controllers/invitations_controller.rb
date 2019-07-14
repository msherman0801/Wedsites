class InvitationsController < DashboardController
    before_action :require_website
    skip_before_action :require_login, only: [:index, :edit, :update]

    def index
        @website = Website.find(params[:website_id]) #using params[:website_id] because user may not be logged in
        @invitations = @website.invitations.where(invitation_params(:first_name, :last_name))
        render json: @invitations
    end

    def new
        @invitation = Invitation.new
        @invitations = current_website.invitations.website_invitations
    end

    def create
        invite = Invitation.create(invitation_params(:first_name, :last_name))
        current_website.invitations << invite
        redirect_to new_invitation_path
    end

    def show
        @invitation = Invitation.find_by(invitation_params(:id))
    end

    def edit
        @website = Website.find(params[:website_id]) #using params[:website_id] because user may not be logged in
        @invitation = Invitation.find_by(invitation_params(:id))
        respond_to do |format|
            format.html { render layout: "websites/layout1" }
            format.json { render json: @invitation }
        end
    end

    def update
        inv = Invitation.find_by(invitation_params(:id))
        inv.update(invitation_params(:attending, :guests, :allergies))
        website = Website.find(params[:website_id])
        respond_to do |format| 
            format.html { redirect_to website_path(website) }
            format.json { render json: inv }
        end
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
