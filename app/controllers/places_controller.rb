class PlacesController < ApplicationController

  before_filter :authenticate_user!, :except => :show
  before_filter :setup_site

  # GET /places
  # GET /places.json
  def index
    @places = @site.places.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = @site.places.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'mobile'}
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = @site.places.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = @site.places.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = @site.places.build(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to site_place_path(@site, @place), notice: 'Place was successfully created.' }
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
    @place = @site.places.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to [@site, @place], notice: 'Place was successfully updated.' }
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
    @place = @site.places.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to site_places_url(@site) }
      format.json { head :no_content }
    end
  end

  private

  def setup_site
    @site = Site.find(params[:site_id])
    # raise "Place does not belong to user" unless @site.organisation.user_id == current_user.id
  end
end

