# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Users
users = User.create!([
                       { name: "Alex" },
                       { name: "Marko" }
                     ])

# Doctors
doctors = Doctor.create!([
                           { name: "Dr. Luke", specialization: "Cardiology", user: users.first },
                           { name: "Dr. Ana", specialization: "Dermatology", user: users.second }
                         ])

# Appointments
appointments = Appointment.create!([
                                     {
                                       user: users.first,
                                       doctor: doctors.first,
                                       scheduled_at: 2.days.from_now,
                                       status: "scheduled",
                                       description: "Regular checkup"
                                     },
                                     {
                                       user: users.second,
                                       doctor: doctors.second,
                                       scheduled_at: 3.days.from_now,
                                       status: "scheduled",
                                       description: "Skin consultation"
                                     }
                                   ])

Rails.logger.debug { "Seeded #{users.count} users, #{doctors.count} doctors, and #{appointments.count} appointments." }
