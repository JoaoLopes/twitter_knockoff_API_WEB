# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# creating the roles
Role.delete_all
admin = Role.create(name: 'admin', description: 'Administrator of the website, GODLIKE!')
user = Role.create(name: 'user',  description: 'A registered user')
guest = Role.create(name: 'guest', description: 'Unknown user')

# creating the permissions
CrudOperation.delete_all
CrudOperation.create([{crud_op: 'C', role: admin, eval_exp: 'true'}, 
                      {crud_op: 'R', role: admin, eval_exp: 'true'}, 
                      {crud_op: 'U', role: admin, eval_exp: 'true'}, 
                      {crud_op: 'D', role: admin, eval_exp: 'true'},

                      {crud_op: 'C', role: user, eval_exp: 'true'}, 
                      {crud_op: 'R', role: user, eval_exp: 'true'}, 
                      {crud_op: 'U', role: user, eval_exp: 'obj.created_by == user'}, 
                      {crud_op: 'D', role: user, eval_exp: 'obj.created_by == user'},

                      {crud_op: 'C', role: guest, eval_exp: 'false'}, 
                      {crud_op: 'R', role: guest, eval_exp: 'true'}, 
                      {crud_op: 'U', role: guest, eval_exp: 'false'}, 
                      {crud_op: 'D', role: guest, eval_exp: 'false'} ])
