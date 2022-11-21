class EnvironmentStateAttributesController < ApplicationController
  before_action :set_environment_state_attribute, only: %i[ show edit update destroy ]

  # GET /environment_state_attributes or /environment_state_attributes.json
  def index
    @environment_state_attributes = EnvironmentStateAttribute.all
  end

  # GET /environment_state_attributes/1 or /environment_state_attributes/1.json
  def show
  end

  # GET /environment_state_attributes/new
  def new
    @environment_state_attribute = EnvironmentStateAttribute.new
  end

  # GET /environment_state_attributes/1/edit
  def edit
  end

  # POST /environment_state_attributes or /environment_state_attributes.json
  def create
    @environment_state_attribute = EnvironmentStateAttribute.new(environment_state_attribute_params)

    respond_to do |format|
      if @environment_state_attribute.save
        format.html { redirect_to environment_state_attribute_url(@environment_state_attribute), notice: "Environment state attribute was successfully created." }
        format.json { render :show, status: :created, location: @environment_state_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @environment_state_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environment_state_attributes/1 or /environment_state_attributes/1.json
  def update
    respond_to do |format|
      if @environment_state_attribute.update(environment_state_attribute_params)
        format.html { redirect_to environment_state_attribute_url(@environment_state_attribute), notice: "Environment state attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @environment_state_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @environment_state_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environment_state_attributes/1 or /environment_state_attributes/1.json
  def destroy
    @environment_state_attribute.destroy

    respond_to do |format|
      format.html { redirect_to environment_state_attributes_url, notice: "Environment state attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment_state_attribute
      @environment_state_attribute = EnvironmentStateAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def environment_state_attribute_params
      params.require(:environment_state_attribute).permit(:name, :values, :environment_state_id)
    end
end
