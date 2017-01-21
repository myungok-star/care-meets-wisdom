# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Senior.destroy_all

require 'ffaker'

#   Senior.create([
#     {name: FFaker::Name.name,
#     location: {FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state},
#     interests: {"Tea time", "Watching classic movies"}
#   },
#   {name: FFaker::Name.name,
#   location: {FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state},
#   interests: {"Badminton", "Reading books"}
# },
# {name: FFaker::Name.name,
# location: {FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state},
# interests: {"Arts & Crafts", "Gardening"}
# },
# {name: FFaker::Name.name,
# location: {FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state},
# interests: {"Photography", "Fishing"}
# },
# {name: FFaker::Name.name,
# location: {FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state},
# interests: {"Picnics", "Cooking"}
# }
#   ]);
