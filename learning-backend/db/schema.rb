# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_08_13_170702) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "activity_type"
    t.bigint "material_id"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_activity_logs_on_material_id"
    t.index ["user_id", "activity_type"], name: "index_user_activity"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "level"
    t.boolean "is_premium", default: false
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "enrolled_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id", "course_id"], name: "index_user_course"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "learning_materials", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.string "title"
    t.string "content_type"
    t.integer "duration_minutes"
    t.boolean "is_premium", default: false
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "display_order"], name: "index_subject_order"
    t.index ["subject_id"], name: "index_learning_materials_on_subject_id"
  end

  create_table "material_attachments", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "media_id", null: false
    t.string "attachment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id", "media_id"], name: "index_material_media"
    t.index ["material_id"], name: "index_material_attachments_on_material_id"
    t.index ["media_id"], name: "index_material_attachments_on_media_id"
  end

  create_table "material_progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "material_id", null: false
    t.string "status", default: "not_started"
    t.integer "last_position", default: 0
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_progresses_on_material_id"
    t.index ["user_id", "material_id"], name: "index_user_material"
    t.index ["user_id"], name: "index_material_progresses_on_user_id"
  end

  create_table "media_library", force: :cascade do |t|
    t.string "file_name"
    t.string "file_type"
    t.integer "file_size_mb"
    t.string "s3_url"
    t.bigint "uploaded_by", null: false
    t.string "approval_status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uploaded_by", "approval_status"], name: "index_uploader_status"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.integer "score"
    t.datetime "completed_at"
    t.integer "attempt_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_attempts_on_quiz_id"
    t.index ["user_id", "quiz_id"], name: "index_user_quiz"
    t.index ["user_id"], name: "index_quiz_attempts_on_user_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.text "question_text"
    t.string "question_type"
    t.json "options"
    t.string "correct_answer"
    t.text "explanation"
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id", "display_order"], name: "index_quiz_order"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.string "title"
    t.integer "passing_score", default: 70
    t.integer "max_attempts", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_quizzes_on_material_id"
  end

  create_table "review_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "material_id", null: false
    t.datetime "next_review_at"
    t.datetime "last_reviewed_at"
    t.float "ease_factor", default: 2.5
    t.integer "review_count", default: 0
    t.integer "interval_days", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_review_schedules_on_material_id"
    t.index ["user_id", "material_id"], name: "index_user_reviews"
    t.index ["user_id"], name: "index_review_schedules_on_user_id"
  end

  create_table "student_reports", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "generated_by_id", null: false
    t.string "report_type"
    t.date "start_date"
    t.date "end_date"
    t.json "metrics"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generated_by_id"], name: "index_student_reports_on_generated_by_id"
    t.index ["student_id", "created_at"], name: "index_student_reports"
    t.index ["student_id"], name: "index_student_reports_on_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "title"
    t.integer "display_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "display_order"], name: "index_course_order"
    t.index ["course_id"], name: "index_subjects_on_course_id"
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.integer "duration_days"
    t.json "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "status"
    t.string "stripe_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["user_id", "plan_id"], name: "index_user_subscription"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "support_tickets", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "admin_id"
    t.string "subject"
    t.text "message"
    t.string "status", default: "open"
    t.integer "priority", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_support_tickets_on_admin_id"
    t.index ["student_id", "status"], name: "index_student_tickets"
    t.index ["student_id"], name: "index_support_tickets_on_student_id"
  end

  create_table "ticket_replies", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "author_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_ticket_replies_on_author_id"
    t.index ["ticket_id", "author_id"], name: "index_ticket_thread"
    t.index ["ticket_id"], name: "index_ticket_replies_on_ticket_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", default: "student"
    t.datetime "last_active_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "activity_logs", "learning_materials", column: "material_id"
  add_foreign_key "activity_logs", "users"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "learning_materials", "subjects"
  add_foreign_key "material_attachments", "learning_materials", column: "material_id"
  add_foreign_key "material_attachments", "media_library", column: "media_id"
  add_foreign_key "material_progresses", "learning_materials", column: "material_id"
  add_foreign_key "material_progresses", "users"
  add_foreign_key "media_library", "users", column: "uploaded_by"
  add_foreign_key "quiz_attempts", "quizzes"
  add_foreign_key "quiz_attempts", "users"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "learning_materials", column: "material_id"
  add_foreign_key "review_schedules", "learning_materials", column: "material_id"
  add_foreign_key "review_schedules", "users"
  add_foreign_key "student_reports", "users", column: "generated_by_id"
  add_foreign_key "student_reports", "users", column: "student_id"
  add_foreign_key "subjects", "courses"
  add_foreign_key "subscriptions", "subscription_plans", column: "plan_id"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "support_tickets", "users", column: "admin_id"
  add_foreign_key "support_tickets", "users", column: "student_id"
  add_foreign_key "ticket_replies", "support_tickets", column: "ticket_id"
  add_foreign_key "ticket_replies", "users", column: "author_id"
end
