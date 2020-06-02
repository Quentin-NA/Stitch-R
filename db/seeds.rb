# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'SupplierSearch Creation'

  SupplierSearch.create(from: "uber.france@uber.com", user_id: 1)
  SupplierSearch.create(from: "noreply@oui.sncf", contains: "Confirmation", user_id: 1)
  SupplierSearch.create(from: "freemobile@free-mobile.fr", user_id: 1)
  SupplierSearch.create(from: "ne_pas_repondre@sfr.fr", contains: "facture", user_id: 1)
  SupplierSearch.create(from: "express@airbnb.com", contains: "receipt", user_id: 1)


