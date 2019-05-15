class InvitationsController < DashboardController
    before_action :require_website
    skip_before_action :require_login, only: [:index, :edit, :update]

    def index
        @website = Website.find(params[:website_id]) #using params[:website_id] because user may not be logged in
        @invitations = Invitation.where(invitation_params(:first_name, :last_name))
        render :layout => "websites/layout1"
    end

    def new
        @invitation = Invitation.new
        @invitations = current_website.invitations.order('last_name ASC')
    end

    def create
        invite = Invitation.create(invitation_params(:first_name, :last_name))
        current_website.invitations << invite
        redirect_to invitations_path
    end

    def show
        binding.pry
        @invitation = Invitation.find_by(invitation_params(:id))
    end

    def edit
        @website = Website.find(params[:website_id]) #using params[:website_id] because user may not be logged in
        @invitation = Invitation.find_by(invitation_params(:id))
    end

    def update
        binding.pry
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
