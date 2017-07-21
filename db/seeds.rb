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
