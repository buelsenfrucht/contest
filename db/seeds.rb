# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create(name: 'points') if Type.find_by_name('points').nil?
Type.create(name: 'weight') if Type.find_by_name('weight').nil?
Type.create(name: 'count')  if Type.find_by_name('count').nil?