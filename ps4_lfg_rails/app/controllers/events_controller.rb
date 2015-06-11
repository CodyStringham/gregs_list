class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:index, :new, :create]

  def index
    @events = @game.events.all
  end

  def show
  end

  def new
    @event = @game.events.new()
  end

  def edit
  end

  def create
    @event = @game.events.new(event_params)
    if @event.save
      redirect_to game_events_path(@event.game), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to game_events_path(@event.game), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to game_events_path(@event.game), notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:game_id])
    end

    def event_params
      params.require(:event).permit(:name, :group_size, :game_id)
    end
end
