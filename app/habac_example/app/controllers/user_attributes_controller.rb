class UserAttributesController < ApplicationController
  before_action :set_user_attribute, only: %i[ show edit update destroy ]

  # GET /user_attributes or /user_attributes.json
  def index
    @user_attributes = UserAttribute.all
  end

  # GET /user_attributes/1 or /user_attributes/1.json
  def show
  end

  # GET /user_attributes/new
  def new
    @user_attribute = UserAttribute.new
  end

  # GET /user_attributes/1/edit
  def edit
  end

  # POST /user_attributes or /user_attributes.json
  def create
    @user_attribute = UserAttribute.new(user_attribute_params)

    respond_to do |format|
      if @user_attribute.save
        format.html { redirect_to user_attribute_url(@user_attribute), notice: "User attribute was successfully created." }
        format.json { render :show, status: :created, location: @user_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_attributes/1 or /user_attributes/1.json
  def update
    respond_to do |format|
      if @user_attribute.update(user_attribute_params)
        format.html { redirect_to user_attribute_url(@user_attribute), notice: "User attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @user_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_attributes/1 or /user_attributes/1.json
  def destroy
    @user_attribute.destroy

    respond_to do |format|
      format.html { redirect_to user_attributes_url, notice: "User attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_attribute
      @user_attribute = UserAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_attribute_params
      params.require(:user_attribute).permit(:user_id, :name, :values)
    end
end
