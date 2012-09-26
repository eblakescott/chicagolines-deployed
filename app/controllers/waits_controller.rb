class WaitsController < ApplicationController
  # GET /waits
  # GET /waits.json
  def index
    @waits = Wait.all

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

  # POST /waits
  # POST /waits.json
  def create
    @wait = Wait.new(params[:wait])

    respond_to do |format|
      if @wait.save
        format.html { redirect_to @wait, notice: 'Wait was successfully created.' }
        format.json { render json: @wait, status: :created, location: @wait }
      else
        format.html { render action: "new" }
        format.json { render json: @wait.errors, status: :unprocessable_entity }
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

  # DELETE /waits/1
  # DELETE /waits/1.json
  def destroy
    @wait = Wait.find(params[:id])
    @wait.destroy

    respond_to do |format|
      format.html { redirect_to waits_url }
      format.json { head :no_content }
    end
  end
end
