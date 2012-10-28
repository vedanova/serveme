class PlacesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_organisation

  # GET /places
  # GET /places.json
  def index
    @places = @organisation.places.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = @organisation.places.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = @organisation.places.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = @organisation.places.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = @organisation.places.build(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to organisation_place_path(@organisation, @place), notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = @organisation.places.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to [@organisation, @place], notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = @organisation.places.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to organisation_places_url(@organisation) }
      format.json { head :no_content }
    end
  end

  private

  def set_organisation
    @organisation = current_user.organisations.find(params[:organisation_id])
  end
end

