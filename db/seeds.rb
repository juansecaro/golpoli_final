# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Institution.create!(
  name: "Ayuntamiento de Llerena",
  cif: "AI-98989887",
  paypal: "alcalde@llerena.org",
  address: "Plaza de España, s/n",
  description: "La ciudad blanca, noble y leal. Cuna de célebres deportistas, lugar donde el deporte y la eṕica van de la mano",
  city: "Llerena",
  postal_code: "06900",
  country: "España",
  bank: "BBVA",
  bank_no: "0192-0458-85-2054-2096",
  img_source: "llerena_thumb.jpg"
)

Pitch.create!(
  name: "Polideportivo municipal",
  normal_price: 10,
  special_price: 15,
  active: true,
  kind: "futbol",
  other: "",
  image: "polillerena.jpg",
  institution_id: 1
)

Pitch.create!(
  name: "Pista de padel cubierta",
  normal_price: 7,
  special_price: 10,
  active: true,
  kind: "padel",
  other: "",
  image: "",
  institution_id: 1
)

Pitch.create!(
  name: "Pista de padel al aire libre",
  normal_price: 10,
  special_price: 15,
  active: true,
  kind: "padel",
  other: "",
  image: "",
  institution_id: 1
)

Schedule.create!(
pitch_id: 1,
date_ref: DateTime.new(2017, 7, 23),
id:1,
h0: nil,
h1: nil,
h2: nil,
h3: nil,
h4: nil,
h5: nil,
h6: nil,
h7: nil,
h8: nil,
h9: nil,
h10: nil,
h11: nil,
h12: nil,
h13: nil,
h14: nil,
h15: nil,
h16: nil,
h17: 1,
h18: 1,
h19: 1,
h20: 1,
h21: 1,
h22: 1,
h23: 1,
h24: 1,
h25: 1,
h26: 1,
h27: 1,
h28: 1,
h29: 2,
h30: 2,
h31: 2,
h32: 0,
h33: 0,
h34: 3,
h35: 3,
h36: 3,
h37: 3,
h38: 3,
h39: nil,
h40: nil,
h41: nil,
h42: nil,
h43: nil,
h44: nil,
h45: nil,
h46: nil,
h47: nil,
)
