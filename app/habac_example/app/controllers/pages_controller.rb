class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    EnvironmentStateAttribute.find_by(name: "parent_in_kitchen").update(values: ["true", "false"].sample)
    @allowed_ops = AuthRule.allowed_ops(current_user).sort_by {|x| x.device_id }
  end

end
