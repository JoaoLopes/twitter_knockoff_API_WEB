class Role < ActiveRecord::Base
  has_many :crud_operations

  @@guest_role_name = 'guest'
  @@admin_role_name = 'admin'
  @@user_role_name = 'user'

  def self.guest
    Role.where(name: guest_role_name).first
  end

  def self.admin
    Role.where(name: admin_role_name).first
  end

  def self.user
    Role.where(name: user_role_name).first
  end

  def self.guest_role_name
    @@guest_role_name
  end

  def self.admin_role_name
    @@admin_role_name
  end

  def self.user_role_name
    @@user_role_name
  end



end
