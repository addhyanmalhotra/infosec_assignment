class EnvironmentStatesController < ApplicationController
  before_action :set_environment_state, only: %i[ show edit update destroy ]

  # GET /environment_states or /environment_states.json
  def index
    @environment_states = EnvironmentState.all
  end

  # GET /environment_states/1 or /environment_states/1.json
  def show
  end

  # GET /environment_states/new
  def new
    @environment_state = EnvironmentState.new
  end

  # GET /environment_states/1/edit
  def edit
  end

  # POST /environment_states or /environment_states.json
  def create
    @environment_state = EnvironmentState.new(environment_state_params)

    respond_to do |format|
      if @environment_state.save
        format.html { redirect_to environment_state_url(@environment_state), notice: "Environment state was successfully created." }
        format.json { render :show, status: :created, location: @environment_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @environment_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environment_states/1 or /environment_states/1.json
  def update
    respond_to do |format|
      if @environment_state.update(environment_state_params)
        format.html { redirect_to environment_state_url(@environment_state), notice: "Environment state was successfully updated." }
        format.json { render :show, status: :ok, location: @environment_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @environment_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environment_states/1 or /environment_states/1.json
  def destroy
    @environment_state.destroy

    respond_to do |format|
      format.html { redirect_to environment_states_url, notice: "Environment state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment_state
      @environment_state = EnvironmentState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def environment_state_params
      params.require(:environment_state).permit(:name)
    end
end
