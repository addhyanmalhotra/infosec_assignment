json.extract! user_attribute, :id, :user_id, :name, :values, :created_at, :updated_at
json.url user_attribute_url(user_attribute, format: :json)
