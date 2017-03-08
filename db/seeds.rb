# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

#create some admins and some normal users
csv_text = File.read(Rails.root.join('lib', 'seeds', 'user.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = User.new
  t.password = row['password']
  t.id = row['id']
  t.email = row['email']
  t.created_at = DateTime.now
  t.first_name = row['first_name']
  t.gender = row['gender']
  t.admin = row['admin']
  t.create_approval(user_id: row['user_id'], approver_id: row['approver_id'])
  t.save!
  puts "#{t.first_name} saved"
end

puts "There are now #{User.count} rows in the transactions table"

#creates the status of projects (fixed dropdown)
csv_text = File.read(Rails.root.join('lib', 'seeds', 'status_project.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = StatusProject.new
  t.id = row['id']
  t.status = row['status']
  t.save!
  puts "#{t.status} saved"
end

puts "There are now #{StatusProject.count} rows in the status_project table"
