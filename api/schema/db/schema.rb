# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_204754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_texts", force: :cascade do |t|
    t.string "field", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_ins", force: :cascade do |t|
    t.bigint "student_id"
    t.string "feeling", null: false
    t.string "body_sensations", null: false, array: true
    t.boolean "talk_to_adult", default: false
    t.integer "fuel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "has_eaten"
    t.boolean "has_slept"
    t.boolean "hurt_or_sick"
    t.boolean "ok_at_home"
    t.boolean "bullied_at_school"
    t.bigint "followed_up_id"
    t.string "intervention"
    t.index ["followed_up_id"], name: "index_check_ins_on_followed_up_id"
    t.index ["student_id"], name: "index_check_ins_on_student_id"
    t.index ["user_id"], name: "index_check_ins_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.date "birthdate", null: false
    t.string "homeroom_teacher", null: false
    t.string "grade", null: false
    t.string "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school_name"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "students_caregivers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_students_caregivers_on_student_id"
    t.index ["user_id", "student_id"], name: "index_students_caregivers_on_user_id_and_student_id", unique: true
    t.index ["user_id"], name: "index_students_caregivers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "phone_number"
    t.boolean "accepted_terms"
    t.datetime "birthdate"
    t.bigint "student_id"
    t.boolean "change_password_on_next_login", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["student_id"], name: "index_users_on_student_id"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "check_ins", "students", on_delete: :cascade
  add_foreign_key "check_ins", "users", column: "followed_up_id"
  add_foreign_key "check_ins", "users", on_delete: :cascade
  add_foreign_key "students", "users", on_delete: :cascade
  add_foreign_key "students_caregivers", "students", on_delete: :cascade
  add_foreign_key "students_caregivers", "users", on_delete: :cascade
  add_foreign_key "users", "students"

  create_view "students_views", sql_definition: <<-SQL
      SELECT students.id,
      students.first_name,
      students.middle_name,
      students.last_name,
      students.birthdate,
      students.homeroom_teacher,
      students.grade,
      students.gender,
      students.school_name,
      students.user_id AS owner_user_id,
      students.user_id AS owner_id,
      students.updated_at,
      ( SELECT row_to_json(latest_check_in.*) AS row_to_json
             FROM ( SELECT check_ins.id,
                      check_ins.user_id,
                      check_ins.student_id,
                          CASE check_ins.fuel
                              WHEN 0 THEN 'red'::text
                              WHEN 1 THEN 'blue'::text
                              WHEN 2 THEN 'yellow'::text
                              WHEN 3 THEN 'green'::text
                              ELSE NULL::text
                          END AS fuel,
                      check_ins.talk_to_adult,
                      check_ins.body_sensations,
                      check_ins.has_eaten,
                      check_ins.has_slept,
                      check_ins.hurt_or_sick,
                      check_ins.ok_at_home,
                      check_ins.bullied_at_school,
                      check_ins.followed_up_id,
                      check_ins.intervention,
                      check_ins.created_at,
                      ( SELECT concat(users_1.first_name, ' ', users_1.last_name) AS concat
                             FROM users users_1
                            WHERE (users_1.id = check_ins.followed_up_id)) AS follower_full_name
                     FROM check_ins
                    WHERE (check_ins.student_id = students.id)
                    ORDER BY check_ins.created_at DESC
                   LIMIT 1) latest_check_in) AS latest_check_in,
      concat(users.first_name, ' ', users.last_name) AS owner_full_name,
      users.role AS owner_role,
      ( SELECT users_1.email
             FROM users users_1
            WHERE (users_1.student_id = students.id)) AS email
     FROM (students
       JOIN users ON ((students.user_id = users.id)))
  UNION ALL
   SELECT students.id,
      students.first_name,
      students.middle_name,
      students.last_name,
      students.birthdate,
      students.homeroom_teacher,
      students.grade,
      students.gender,
      students.school_name,
      students_caregivers.user_id AS owner_user_id,
      students.user_id AS owner_id,
      students.updated_at,
      ( SELECT row_to_json(latest_check_in.*) AS row_to_json
             FROM ( SELECT check_ins.id,
                      check_ins.user_id,
                      check_ins.student_id,
                      check_ins.feeling,
                          CASE check_ins.fuel
                              WHEN 0 THEN 'red'::text
                              WHEN 1 THEN 'blue'::text
                              WHEN 2 THEN 'yellow'::text
                              WHEN 3 THEN 'green'::text
                              ELSE NULL::text
                          END AS fuel,
                      check_ins.talk_to_adult,
                      check_ins.body_sensations,
                      check_ins.has_eaten,
                      check_ins.has_slept,
                      check_ins.hurt_or_sick,
                      check_ins.ok_at_home,
                      check_ins.bullied_at_school,
                      check_ins.followed_up_id,
                      check_ins.intervention,
                      check_ins.created_at,
                      ( SELECT concat(users_1.first_name, ' ', users_1.last_name) AS concat
                             FROM users users_1
                            WHERE (users_1.id = check_ins.followed_up_id)) AS follower_full_name
                     FROM check_ins
                    WHERE (check_ins.student_id = students.id)
                    ORDER BY check_ins.created_at DESC
                   LIMIT 1) latest_check_in) AS latest_check_in,
      concat(users.first_name, ' ', users.last_name) AS owner_full_name,
      users.role AS owner_role,
      ( SELECT users_1.email
             FROM users users_1
            WHERE (users_1.student_id = students.id)) AS email
     FROM ((students
       JOIN students_caregivers ON ((students.id = students_caregivers.student_id)))
       JOIN users ON ((students.user_id = users.id)));
  SQL
end
