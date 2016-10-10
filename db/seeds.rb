# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# creating the roles
Role.delete_all
admin = Role.create(name: Role.admin_role_name, description: 'Administrator of the website, GODLIKE!')
user = Role.create(name: Role.user_role_name,  description: 'A registered user')
guest = Role.create(name: Role.guest_role_name, description: 'Unknown user')

# creating the permissions
CrudOperation.delete_all
CrudOperation.create([{crud_op: '*', role: admin, controller: 'default', eval_exp: 'true'}, 
                      
                      {crud_op: 'C', role: user, controller: 'default', eval_exp: 'true'}, 
                      {crud_op: 'R', role: user, controller: 'default', eval_exp: 'true'}, 
                      {crud_op: 'U', role: user, controller: 'default', eval_exp: 'logged_in? and !obj.nil? and obj.user == current_user'}, 
                      {crud_op: 'D', role: user, controller: 'default', eval_exp: 'logged_in? and !obj.nil? and obj.user == current_user'},

                      {crud_op: 'C', role: guest, controller: 'default', eval_exp: 'false'}, 
                      {crud_op: 'R', role: guest, controller: 'default', eval_exp: 'true'}, 
                      {crud_op: 'U', role: guest, controller: 'default', eval_exp: 'false'}, 
                      {crud_op: 'D', role: guest, controller: 'default', eval_exp: 'false'},

                      {crud_op: '*', role: admin, controller: 'crud_operations', eval_exp: 'true'}, 
                      {crud_op: '*', role: user, controller: 'crud_operations', eval_exp: 'false'}, 
                      {crud_op: '*', role: guest, controller: 'crud_operations', eval_exp: 'false'},

                      {crud_op: '*', role: admin, controller: 'roles', eval_exp: 'true'}, 
                      {crud_op: '*', role: user, controller: 'roles', eval_exp: 'false'}, 
                      {crud_op: '*', role: guest, controller: 'roles', eval_exp: 'false'},
                      
                      {crud_op: 'C', role: guest, controller: 'users', eval_exp: 'true'}, 

                      {crud_op: '*', role: guest, controller: 'sessions', eval_exp: 'true'},
                      {crud_op: '*', role: user, controller: 'sessions', eval_exp: 'true'}
                      
                      ])
