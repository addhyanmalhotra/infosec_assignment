class AuthRule < ApplicationRecord
  def self.get_env(k)
    k.downcase!
    if k == "time"
      return Time.now.hour.to_s
    end
    if k == "day"
      return Time.now.wday.to_s
    end
    if k == "parent_in_kitchen"
      return EnvironmentStateAttribute.find_by(name: "parent_in_kitchen").values
    end
  end
  def self.check(k,v)
    return false if !k.present? && v.present?
    k.downcase!
    v.downcase!
    return k.in? v
  end

  def self.allowed_ops(user)
    Operation.select { |op| AuthRule.check_op(user, op)}
  end

  def self.check_op(user, req_op)
    AuthRule.all.each do |auth_rule|
      next unless auth_rule.da.present? || auth_rule.ua.present? || auth_rule.oa.present? || auth_rule.esa.present?
      allowed = true

      # Check device attr constraints
      if auth_rule.da.present?
        k = req_op.device.device_attributes.find_by(name: auth_rule.da)&.values
        v = auth_rule.dav
        allowed = allowed && check(k,v)
      end

      # Check op attr constraints
      if auth_rule.oa.present?
        k = req_op.operation_attributes.find_by(name: auth_rule.oa)&.values
        v = auth_rule.oav
        allowed = allowed && check(k,v)
      end

      # Check device attr constraints
      if auth_rule.ua.present?
        k = user.user_attributes.find_by(name: auth_rule.ua)&.values
        v = auth_rule.uav
        allowed = allowed && check(k,v)
      end

      if auth_rule.esa.present?
        k = get_env(auth_rule.esa)
        v = auth_rule.esav
        allowed = allowed && check(k,v)
      end
      return true if allowed
    end
    return false
  end
end
