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
codeine = Treatment.create!(name:"codeine", category: "pills")
amoxiciline = Treatment.create!(name:"antibio", category: "pills")

bandage = Treatment.create!(name: "bandage", category: "cares")
cream = Treatment.create!(name: "skin cream on burn", category: "cares")
bath = Treatment.create!(name: "feet bath", category: "cares")
betadine = Treatment.create!(name: "betadine, neutral cleanser", category: "cares")

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

prescription_1 = Prescription.create!(start_date: "10/03/2023", end_date: "20/03/2023", todo_hours: 12, todo_minutes: 30, day_half: "PM", comment: "2 x 500mg - Take the pills before the main meal of the day", user: diane, treatment: paracetamol)

prescription_2 = Prescription.create!(start_date: "07/03/2023", end_date: "17/03/2023", todo_hours: 9, todo_minutes: 00,  day_half: "AM", comment: "3 x 125mg - Take the pills before going to sleep", user: diane, treatment: tylenol)

prescription_3 = Prescription.create!(start_date: "02/03/2023", end_date: "22/03/2023", todo_hours: 10, todo_minutes: 00, day_half: "AM",  comment: "1 x 250mg - In the morning ", user: diane, treatment: amoxiciline)

prescription_4 = Prescription.create!(start_date: "03/03/2023", end_date: "18/03/2023", todo_hours: 11, todo_minutes: 30, day_half: "AM",  comment: "2 tablets - Take with a fair amount of water", user: diane, treatment: relaxon)

prescription_5 = Prescription.create!(start_date: "15/03/2023", end_date: "17/03/2023", todo_hours: 12, todo_minutes: 30, day_half: "PM",  comment: "4 x 250mg - Take during the meal", user: theo, treatment: muscadol)

prescription_6 = Prescription.create!(start_date: "04/03/2023", end_date: "19/03/2023", todo_hours: 4, todo_minutes: 00, day_half: "PM",  comment: "1 x 500mg - Take in the afternoon", user: theo, treatment: targin)

prescription_7 = Prescription.create!(start_date: "03/03/2023", end_date: "18/03/2023", todo_hours: 9, todo_minutes: 00, day_half: "PM",  comment: "Apply a fair amount on the burnt area before going to bed", user: diane, treatment: cream)

prescription_8 = Prescription.create!(start_date: "18/03/2023", end_date: "17/03/2023", todo_hours: 7, todo_minutes: 00, day_half: "PM",  comment: "During your shower, instead of the current shower gel and shampoo", user: theo, treatment: betadine)

prescription_9 = Prescription.create!(start_date: "04/03/2023", end_date: "19/03/2023", todo_hours: 2, todo_minutes: 00, day_half: "PM",  comment: "Save a 1h-time slot to practice meditation to relax and accept the present time", user: diane, treatment: meditation)


# creating doctors


doctor1 = Doctor.create!(title: "Dr.", name: "Doe", specialty: "Surgeon", address: "26 rue pradier paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor2 = Doctor.create!(title: "Nurse", name: "Smith", specialty: "Pediatrics", address: "3 rue jean robert Paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor3 = Doctor.create!(title: "Pr.", name: "Johnson", specialty: "Dermatology", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor4 = Doctor.create!(title: "Pr.", name: "Malek", specialty: "Cardiologist", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor5 = Doctor.create!(title: "Dr.", name: "Hendricks", specialty: "Dermatology", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor6 = Doctor.create!(title: "Nurse", name: "Donovan", specialty: "General", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: diane)
doctor7 = Doctor.create!(title: "Pr.", name: "Pilgert", specialty: "Cancer", address: "51 rue sedaine Paris", latitude: 37.7749, longitude: -122.4194, user: diane)

# Ajouter une colonne AM / PM dans le formulaire pour gérer la logique matin/aprem
appointment1 = Appointment.create(date: Date.parse('11/12/2023'), comment: "Checkup", user: diane , doctor: doctor1, appointment_hour: 10, appointment_min: 30)
appointment2 = Appointment.create(date: Date.today, comment: "Checkup", user: theo, doctor: doctor2, appointment_hour: 11, appointment_min: 30 )
appointment3 = Appointment.create(date: Date.today, comment: "Checkup", user: theo, doctor: doctor3, appointment_hour: 12, appointment_min: 30 )
appointment4 = Appointment.create(date: Date.today, comment: "Checkup", user: theo, doctor: doctor4, appointment_hour: 13, appointment_min: 30 )
appointment5 = Appointment.create(date: Date.today, comment: "Checkup", user: theo, doctor: doctor5, appointment_hour: 14, appointment_min: 30 )
appointment6 = Appointment.create(date: Date.today, comment: "Checkup", user: diane, doctor: doctor6, appointment_hour: 15, appointment_min: 30 )
appointment7 = Appointment.create(date: Date.today, comment: "Checkup", user: theo, doctor: doctor7, appointment_hour: 16, appointment_min: 30 )



puts "Seeded"
