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
bath = Treatment.create!(name: "feet bath", category: "cares")
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
prescription_1 = Prescription.create!(start_date: "10/03/2023", end_date: "20/03/2023", todo_hours: 12, todo_minutes: 30, comment: "2 x 500mg - Take the pills before the main meal of the day", user: theo, treatment: paracetamol)

prescription_2 = Prescription.create!(start_date: "07/03/2023", end_date: "17/03/2023", todo_hours: 21, todo_minutes: 00, comment: "3 x 125mg - Take the pills before going to sleep", user: theo, treatment: tylenol)

prescription_3 = Prescription.create!(start_date: "02/03/2023", end_date: "22/03/2023", todo_hours: 10, todo_minutes: 00, comment: "1 x 250mg - In the morning ", user: theo, treatment: apronax)

prescription_4 = Prescription.create!(start_date: "03/03/2023", end_date: "18/03/2023", todo_hours: 11, todo_minutes: 30, comment: "2 tablets - Take with a fair amount of water", user: theo, treatment: relaxon)

prescription_5 = Prescription.create!(start_date: "15/03/2023", end_date: "17/03/2023", todo_hours: 12, todo_minutes: 30, comment: "4 x 250mg - Take during the meal", user: theo, treatment: muscadol)

prescription_6 = Prescription.create!(start_date: "04/03/2023", end_date: "19/03/2023", todo_hours: 16, todo_minutes: 00, comment: "1 x 500mg - Take in the afternoon", user: theo, treatment: targin)

prescription_7 = Prescription.create!(start_date: "03/03/2023", end_date: "18/03/2023", todo_hours: 21, todo_minutes: 00, comment: "Apply a fair amount on the burnt area before going to bed", user: theo, treatment: cream)

prescription_8 = Prescription.create!(start_date: "18/03/2023", end_date: "17/03/2023", todo_hours: 19, todo_minutes: 00, comment: "During your shower, use this shampoo to ease the scalp itching for the next 48 hours", user: theo, treatment: shampoo)

prescription_9 = Prescription.create!(start_date: "04/03/2023", end_date: "19/03/2023", todo_hours: 14, todo_minutes: 00, comment: "Save a 1h-time slot to practice meditation to relax and accept the present time", user: theo, treatment: meditation)


# creating doctors

doctor1 = Doctor.create!(title: "Doctor", name: "John Doe", specialty: "Cardiology", address: "26 rue pradier paris", latitude: 37.7749, longitude: -122.4194, user: maung)
doctor2 = Doctor.create!(title: "Nurse", name: "Jane Smith", specialty: "Pediatrics", address: "3 rue jean robert Paris", latitude: 37.7749, longitude: -122.4194, user: maung)
doctor3 = Doctor.create!(title: "Professor", name: "Bob Johnson", specialty: "Dermatology", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: maung)

appointment1 = Appointment.create(title: "Doctor", date: Date.parse('11/12/2023'), comment: "Checkup", user: user1, doctor: doctor1, appointment_hour: 10, appointment_min: 30)
appointment2 = Appointment.create(title: "Nurse", date: Date.parse('03/05/2023'), comment: "Checkup", user: user2, doctor: doctor3, appointment_hour: 10, appointment_min: 30)

puts "Seeded"
