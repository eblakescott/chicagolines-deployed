class WaitsController < ApplicationController
  # GET locations/:location_id/waits
  # GET locations/:location_id/waits.json
  
def index
    # Wait.all is no longer needed, so it's commented out (but left here for reference)
    # @waits = Wait.all

    # Instead, we get the current Location based on the URL /locations/:location_id/waits
    # The model association has_many :waits will allow us to grab all waits index
    # the waits index.html.erb view through the @location.waits method:

    @location = Location.find(params[:location_id]) # Grab the Location based on the URL

    # Finally, let's set up a new instance of @wait so that a form appears
    # at the bottom of the wait listing for someone to write a new Wait
    # on the current location

    @wait = Wait.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waits }
    end
  end

  # GET /waits/1
  # GET /waits/1.json
  def show
    @wait = Wait.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wait }
    end
  end

  # GET /waits/new
  # GET /waits/new.json
  def new
    @wait = Wait.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wait }
    end
  end

  # GET /waits/1/edit
  def edit
    @wait = Wait.find(params[:id])
  end

  # POST locations/:location_id/waits
  # POST locations/:location_id/waits.json
  def create

    @location = Location.find(params[:location_id]) # Grab the Location based on the URL

    #@wait = Wait.new(params[:wait])
    @wait = @location.waits.build(params[:wait])

    respond_to do |format|
      if @wait.save
        format.html { redirect_to location_waits_path(@location), notice: 'Wait was successfully created.' }
        #format.json { render json: @wait, status: :created, location: @wait }
      else
        #format.html { render action: "new" }
        #format.json { render json: @wait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waits/1
  # PUT /waits/1.json
  def update
    @wait = Wait.find(params[:id])

    respond_to do |format|
      if @wait.update_attributes(params[:wait])
        format.html { redirect_to @wait, notice: 'Wait was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE locations/:location_id/waits/1
  # DELETE locations/:location_id/waits/1.json
  def destroy

    @location = Location.find(params[:location_id]) # Grab the Location based on the URL

    @wait = Wait.find(params[:id])
    @wait.destroy

    respond_to do |format|
      format.html { redirect_to location_waits_path(@location) }
      format.json { head :no_content }
    end
  end
end
