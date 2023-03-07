puts "Cleaning the database"
User.destroy_all
Treatment.destroy_all
Doctor.destroy_all


puts "Seeding"

# Creating the Treatments
paracetamol = Treatment.create!(name: "paracetamol", category: "pills")
tylenol = Treatment.create!(name: "tylenol", category: "pills")
apronax = Treatment.create!(name: "apronax", category: "pills")
dectancyl = Treatment.create!(name: "dectancyl", category: "pills")
relaxon = Treatment.create!(name: "relaxon", category: "pills")
muscadol = Treatment.create!(name: "muscadol", category: "pills")
targin = Treatment.create!(name: "targin", category: "pills")
zopiclone = Treatment.create!(name: "zopiclone", category: "pills")
humira = Treatment.create!(name: "humira", category: "pills")
navidoxine = Treatment.create!(name: "navidoxine", category: "pills")

bandage = Treatment.create!(name: "bandage", category: "cares")
cream = Treatment.create!(name: "skin cream on burn", category: "cares")
bath = Treatment.create!(name: "feet_bath", category: "cares")
shampoo = Treatment.create!(name: "scalp shampoo for eczema", category: "cares")

meditation = Treatment.create!(name: "meditation", category: "exercises")
relaxation = Treatment.create!(name: "relaxation", category: "exercises")
gentle_walk = Treatment.create!(name: "gentle walk", category: "exercises")
dynamic_walk = Treatment.create!(name: "dynamic walk", category: "exercises")
physical_exercice = Treatment.create!(name: "physical exercise", category: "exercises")


# Creating the users
theo = User.create!(
  email: "tt@gmail.com" ,
  password: "123456",
  first_name: "theo",
  last_name: "thiberge",
  birthdate: "01/01/1992",
  address: "68 avenue Parmentier Paris"
)
joy = User.create!(
  email: "joy@icloud.com" ,
  password: "123456",
  first_name: "joy",
  last_name: "danenberg",
  birthdate: "04/04/1993",
  address: "12 rue saint Maur Paris"
)
diane = User.create!(
  email: "diane@icloud.com" ,
  password: "123456",
  first_name: "diane",
  last_name: "lesvenan",
  birthdate: "03/03/1994",
  address: "place de l'église Neuilly sur seine"
)
maung = User.create!(
  email: "maung@icloud.com" ,
  password: "123456",
  first_name: "maung maung",
  last_name: "kha",
  birthdate: "05/06/1990",
  address: "gare montparnasse Paris"
)

# Creating the prescriptions
prescription_1 = Prescription.new(start_date: "", end_date: "", time: "", )


puts "Seeded"

# Theo = User.create!(
#   email: ,
#   encrypted_password: ,
#   first_name: ,
#   last_name: ,
#   birthdate: ,
#   address:
# )
