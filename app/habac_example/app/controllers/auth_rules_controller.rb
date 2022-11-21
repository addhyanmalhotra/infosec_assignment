class AuthRulesController < ApplicationController
  before_action :set_auth_rule, only: %i[ show edit update destroy ]

  # GET /auth_rules or /auth_rules.json
  def index
    @auth_rules = AuthRule.all
  end

  # GET /auth_rules/1 or /auth_rules/1.json
  def show
  end

  # GET /auth_rules/new
  def new
    @auth_rule = AuthRule.new
  end

  # GET /auth_rules/1/edit
  def edit
  end

  # POST /auth_rules or /auth_rules.json
  def create
    @auth_rule = AuthRule.new(auth_rule_params)

    respond_to do |format|
      if @auth_rule.save
        format.html { redirect_to auth_rule_url(@auth_rule), notice: "Auth rule was successfully created." }
        format.json { render :show, status: :created, location: @auth_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auth_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_rules/1 or /auth_rules/1.json
  def update
    respond_to do |format|
      if @auth_rule.update(auth_rule_params)
        format.html { redirect_to auth_rule_url(@auth_rule), notice: "Auth rule was successfully updated." }
        format.json { render :show, status: :ok, location: @auth_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auth_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_rules/1 or /auth_rules/1.json
  def destroy
    @auth_rule.destroy

    respond_to do |format|
      format.html { redirect_to auth_rules_url, notice: "Auth rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_rule
      @auth_rule = AuthRule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auth_rule_params
      params.require(:auth_rule).permit(:operation_id, :ua, :uav, :da, :dav, :oa, :oav, :esa, :esav)
    end
end
