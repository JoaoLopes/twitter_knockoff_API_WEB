class Role < ActiveRecord::Base
  has_many :crud_operations
end
