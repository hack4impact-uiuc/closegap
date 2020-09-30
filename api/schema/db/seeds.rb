# frozen_string_literal: true

# rubocop:disable all
require 'model_factories'
include ModelFactories

puts 'Seeding database with test data...'
seed_database
puts 'done!'
# rubocop:enable all

# Create Users
user1 = User.create!(
  email: 'foo1@bar.com', password: '123456789', first_name: 'John'
)
user2 = User.create!(
  email: 'foo2@bar.com', password: '123456789', first_name: 'Mary'
)

# Create Students
student1 = Student.create!(
  user: user1, first_name: 'Ipsum1', middle_name: 'Lorem1', grade: '1st',
  last_name: 'Dolor1', birthdate: '2010/11/14', homeroom_teacher: 'Amet1',
  gender: 'male', school_name: 'some school name'
)
student2 = Student.create!(
  user: user1, first_name: 'Ipsum2', middle_name: 'Lorem2', gender: 'female',
  last_name: 'Dolor2', birthdate: '2008/09/04', homeroom_teacher: 'Amet2',
  grade: '2nd', school_name: 'some school name'
)
student3 = Student.create!(
  user: user1, first_name: 'Ipsum3', middle_name: 'Lorem3', grade: '3rd',
  last_name: 'Dolor3', birthdate: '2006/03/25', homeroom_teacher: 'Amet3',
  gender: 'male', school_name: 'some school name'
)
student4 = Student.create!(
  user: user1, first_name: 'Ipsum4', middle_name: 'Lorem4', grade: '4th',
  last_name: 'Dolor4', birthdate: '2005/05/02', homeroom_teacher: 'Amet4',
  gender: 'other', school_name: 'some school name'
)
student5 = Student.create!(
  user: user1, first_name: 'Ipsum5', middle_name: 'Lorem5', grade: '5th',
  last_name: 'Dolor5', birthdate: '2003/03/08', homeroom_teacher: 'Amet5',
  gender: 'male', school_name: 'some school name'
)
student6 = Student.create!(
  user: user1, first_name: 'Ipsum6', middle_name: 'Lorem6', gender: 'female',
  last_name: 'Dolor6', birthdate: '2002/07/23', homeroom_teacher: 'Amet6',
  grade: '6th', school_name: 'some school name'
)
student7 = Student.create!( # Student of user2
  user: user2, first_name: 'Ipsum7', middle_name: 'Lorem7', grade: '7th',
  last_name: 'Dolor7', birthdate: '2001/11/15', homeroom_teacher: 'Amet7',
  gender: 'other', school_name: 'some school name'
)
Student.create!( # Student of user1 without check-in
  user: user1, first_name: 'Ipsum8', middle_name: 'Lorem8',
  last_name: 'Dolor8', birthdate: '2000/05/02', homeroom_teacher: 'Amet8',
  grade: '8st', gender: 'other', school_name: 'some school name'
)

# Create Students check-ins
CheckIn.create!( # Check-in - Talk to adult - red (today)
  user: user1, student: student1, feeling: 'sad', fuel: 'red',
  talk_to_adult: true, body_sensations: %w[stuck-or-frozen tired-or-weak empty]
)
CheckIn.create!( # Check-in - Talk to adult - blue (today)
  user: user1, student: student2, feeling: 'tired', fuel: 'blue',
  talk_to_adult: true,
  body_sensations: %w[spacey-or-zoned-out light-or-empty sleepy]
)
CheckIn.create!( # Check-in - Don't talk to adult - blue (today)
  user: user1, student: student3, feeling: 'tired', fuel: 'blue',
  talk_to_adult: false,
  body_sensations: %w[nothing-or-numb heavy-or-full fuzzy-or-unclear]
)
CheckIn.create!( # Check-in - Don't talk to adult - yellow (today)
  user: user1, student: student4, feeling: 'silly', fuel: 'yellow',
  talk_to_adult: false, body_sensations: %w[comfy-or-at-ease warm]
)
CheckIn.create!( # Check-in - Don't talk to adult - green (today)
  user: user1, student: student5, feeling: 'happy', fuel: 'green',
  talk_to_adult: false, body_sensations: %w[awake heart-flutters energetic]
)
CheckIn.create!( # Check-in - Talk to adult - blue (last week)
  user: user1, student: student6, feeling: 'happy', fuel: 'blue',
  talk_to_adult: true,
  body_sensations: %w[warm awake], created_at: Date.current.weeks_ago(1)
)
CheckIn.create!( # Check-in - (user2) to check if doesn't appear at user1
  user: user2, student: student7, feeling: 'upset', fuel: 'green',
  talk_to_adult: false,
  body_sensations: %w[heavy-chest-or-heart sick-to-my-stomache shakey-or-fidgety
                      hot-or-sweaty]
)

# Create more today and last week check-ins for student1
CheckIn.create!( # Check-in - Talk to adult - blue (last week)
  user: user1, student: student1, feeling: 'happy', fuel: 'blue',
  talk_to_adult: true,
  body_sensations: %w[warm awake], created_at: Date.current.weeks_ago(1)
)
CheckIn.create!( # Check-in - Don't talk to adult - blue (today)
  user: user1, student: student1, feeling: 'tired', fuel: 'blue',
  talk_to_adult: false,
  body_sensations: %w[nothing-or-numb heavy-or-full fuzzy-or-unclear]
)
CheckIn.create!( # Check-in - Don't talk to adult - yellow (today)
  user: user1, student: student1, feeling: 'silly', fuel: 'yellow',
  talk_to_adult: false, body_sensations: %w[comfy-or-at-ease warm]
)

AdminText.create!(field: 'student_user_welcome_title', text: 'Welcome Student')

AdminText.create!(
  field: 'student_user_welcome_subject',
  text: 'Welcome Student'
)

AdminText.create!(
  field: 'student_user_welcome_description',
  text: <<-TEXT
    You have been subscribed to our system. please click on the link below to change your password
  TEXT
)

AdminText.create!(
  field: 'student_user_welcome_link_text',
  text: 'Create my password'
)
