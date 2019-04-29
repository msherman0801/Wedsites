class EventsController < DashboardController

    def index
    end

    def new
        @event = Event.new
    end
    
    def create
        event = Event.create(params.require(:event).permit(:title, :description, :date, :location, :attire))
        current_website.events << event
        redirect_to event_path(event)
    end
    
    def show
        @event = Event.find(params[:id])
    end

    def update
    end

    private

    def event_params(*args)
        params.permit(:event).permit(*args)
    end
end
