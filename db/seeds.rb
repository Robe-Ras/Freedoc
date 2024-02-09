# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



require 'faker'
Faker::Config.locale = 'fr'

# Je crée des spécialités
specialties = ['Médecin', 'Dermatologue', 'Pédiatre', 'Chirurgien', 'Gynécologue', 'Grand Marabout', 'Maître Vaudou']

specialties.each do |specialty_name|
  Specialty.create(name: specialty_name)
end

# Je crée des villes via faker
5.times do
  City.create(name: Faker::Address.city)
end

# Je crée des docteurs via faker
20.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: City.order("RANDOM()").first
  )
  # J'attribue de spécialités aléatoires aux docteurs dans une limite max de 3
  random_specialties = Specialty.order("RANDOM()").limit(rand(1..3))
  doctor.specialties << random_specialties
end

# Je crée des patients via faker
40.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.order("RANDOM()").first
  )
end

# Je crée des rendez-vous
60.times do
  doctor = Doctor.order("RANDOM()").first
  patient = Patient.order("RANDOM()").first
  Appointment.create(
    date: Faker::Time.between(from: DateTime.now, to: 1.year.from_now),
    doctor: doctor,
    patient: patient,
    city: doctor.city # Ou patient.city, selon de ta logique
  )
end