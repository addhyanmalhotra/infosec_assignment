class OperationAttributesController < ApplicationController
  before_action :set_operation_attribute, only: %i[ show edit update destroy ]

  # GET /operation_attributes or /operation_attributes.json
  def index
    @operation_attributes = OperationAttribute.all
  end

  # GET /operation_attributes/1 or /operation_attributes/1.json
  def show
  end

  # GET /operation_attributes/new
  def new
    @operation_attribute = OperationAttribute.new
  end

  # GET /operation_attributes/1/edit
  def edit
  end

  # POST /operation_attributes or /operation_attributes.json
  def create
    @operation_attribute = OperationAttribute.new(operation_attribute_params)

    respond_to do |format|
      if @operation_attribute.save
        format.html { redirect_to operation_attribute_url(@operation_attribute), notice: "Operation attribute was successfully created." }
        format.json { render :show, status: :created, location: @operation_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operation_attributes/1 or /operation_attributes/1.json
  def update
    respond_to do |format|
      if @operation_attribute.update(operation_attribute_params)
        format.html { redirect_to operation_attribute_url(@operation_attribute), notice: "Operation attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @operation_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operation_attributes/1 or /operation_attributes/1.json
  def destroy
    @operation_attribute.destroy

    respond_to do |format|
      format.html { redirect_to operation_attributes_url, notice: "Operation attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation_attribute
      @operation_attribute = OperationAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_attribute_params
      params.require(:operation_attribute).permit(:name, :values, :operation_id)
    end
end
