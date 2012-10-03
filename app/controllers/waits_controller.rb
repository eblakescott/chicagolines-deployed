class WaitsController < ApplicationController

# Use a before_filter to find the current quote; actual method is private,
  # and defined at the bottom of this file. The current quote is always found
  # before any of the actions on the controller run.
  #
  # See http://guides.rubyonrails.org/action_controller_overview.html#filters

  before_filter :find_current_location

  # GET quotes/:quote_id/comments
  # GET quotes/:quote_id/comments.json
  def index

    # Set up a new instance of @comment so that a form appears
    # at the bottom of the comment listing for someone to write
    # a new Comment on the current quote:

    @wait = Wait.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waits }
    end
  end

  # POST quotes/:quote_id/comments
  # POST quotes/:quote_id/comments.json
  def create

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

  # DELETE quotes/:quote_id/comments/1
  # DELETE quotes/:quote_id/comments/1.json
  def destroy

    @wait = Wait.find(params[:id])
    @wait.destroy

    respond_to do |format|
      format.html { redirect_to location_waits_path(@location) }
      format.json { head :no_content }
    end
  end

  private

  def find_current_location
    @location = Location.find(params[:location_id]) # Grab the Quote based on the URL
  end

end
