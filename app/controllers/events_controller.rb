class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, :only => [:public_view , :show ,:simple_search ,:adv_search]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  def public_view
    if params[:theme_id].present?
      @theme = Theme.find(params[:theme_id].to_i)
      @header = "#{@theme.tittle} Events"
      @events = Event.published.where(theme_id: params[:theme_id]).order("created_at desc").page(params[:page]).per(20)

    elsif params[:type].present?
      @events = Event.send(params[:type]).page(params[:page]).per(20)
      @header = "#{params[:type].humanize}"
    else
      @events = Event.published.page(params[:page]).per(20)
      @header = "Events"
    end
    
  end


  def simple_search
    @events = Event.simple_search(params[:q])
    respond_to do |format|
      format.js {}
    end
    
  end


  def adv_search
    @events = Event.adv_search(params[:adv_search]).page(params[:page]).per(20)
    respond_to do |format|
      format.js {}
      format.html { render "public_view"}
    end
    
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
            :title, 
            :description, 
            :icon_path, 
            :file_path, 
            :starts_at, 
            :ends_at, 
            :country, 
            :location, 
            :djs, 
            :venue, 
            :tags,
            :genres, 
            :intro,
            :editor_choice,
            :published,
            :theme_id, 
            event_links_attributes: 
              [:id, :name, :description, :link, :link_type,:file_path , :_destroy], 
            event_photos_attributes: 
              [:id, :name, :description, :file_path ,  :_destroy]
          )
    end
end
