# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :set_property, only: %i(show edit update destroy)

  before_action :load_vrbo_association, only: %i(new edit)

  # GET /properties
  # GET /properties.json
  def index
    @properties = policy_scope(Property)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show; end

  # GET /properties/new
  def new
    authorize @property
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.new(property_params)
    authorize @property

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
    authorize @property
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def property_params
    params.require(:property).permit(
      :title, :description, :city, :state, :home_type,
      :bedrooms, :sleeps, :recreational_type, :frequency,
      peak_season_ids: [],
      property_externals_attributes: %i(id external_id entity)
    )
  end

  def load_vrbo_association
    @property ||= Property.new
    @property.property_externals.vrbo.first_or_initialize
  end
end
