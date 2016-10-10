class CrudOperation < ActiveRecord::Base
  belongs_to :role

  @@default_controller = 'default'

  def self.default_controller
    @@default_controller
  end

end
