class LocationsController < ApplicationController

 # Here is our custom category action; this is lifted almost verbatim from
  # the index action, except that we use the find_all_by_XXX method that
  # Rails gives us, and the params[:category] fragment from the route we
  # created. To double-up on the views, we tell category to render the view
  # in app/views/locations/index.html.erb -- although if the category view
  # were drastically different, we could leave out the render line and just
  # create a view in app/views/locations/category.html.erb

  # GET /locations/:category/list
  def category
    @locations = Location.find_all_by_category(params[:category])

    respond_to do |format|
      format.html { render :template => "locations/index" } # index.html.erb
    end
  end

#Trying to implement a search; currently not filtering
def index
  @locations = Location.search(params[:search])
end


  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
