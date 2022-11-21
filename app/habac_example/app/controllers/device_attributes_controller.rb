class DeviceAttributesController < ApplicationController
  before_action :set_device_attribute, only: %i[ show edit update destroy ]

  # GET /device_attributes or /device_attributes.json
  def index
    @device_attributes = DeviceAttribute.all
  end

  # GET /device_attributes/1 or /device_attributes/1.json
  def show
  end

  # GET /device_attributes/new
  def new
    @device_attribute = DeviceAttribute.new
  end

  # GET /device_attributes/1/edit
  def edit
  end

  # POST /device_attributes or /device_attributes.json
  def create
    @device_attribute = DeviceAttribute.new(device_attribute_params)

    respond_to do |format|
      if @device_attribute.save
        format.html { redirect_to device_attribute_url(@device_attribute), notice: "Device attribute was successfully created." }
        format.json { render :show, status: :created, location: @device_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_attributes/1 or /device_attributes/1.json
  def update
    respond_to do |format|
      if @device_attribute.update(device_attribute_params)
        format.html { redirect_to device_attribute_url(@device_attribute), notice: "Device attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @device_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_attributes/1 or /device_attributes/1.json
  def destroy
    @device_attribute.destroy

    respond_to do |format|
      format.html { redirect_to device_attributes_url, notice: "Device attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_attribute
      @device_attribute = DeviceAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def device_attribute_params
      params.require(:device_attribute).permit(:name, :values, :device_id)
    end
end
