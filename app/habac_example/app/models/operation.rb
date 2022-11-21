class Operation < ApplicationRecord
  belongs_to :device
  has_many :operation_attributes
end
