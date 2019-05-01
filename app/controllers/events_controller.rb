class EventsController < DashboardController

    def index
        @events = current_website.events.all
    end

    def new
        @event = Event.new
    end
    
    def create
        event = Event.create(event_params)
        current_website.events << event
        redirect_to event_path(event)
    end
    
    def show
        @event = id(Event)
    end

    def edit
        @event = id(Event)
    end

    def update
        event = id(Event)
        event.update(event_params)
        event.save
        redirect_to event_path(event)
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location, :attire)
    end
end
