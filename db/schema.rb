# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161205005822) do

  create_table "historiausuarios", force: :cascade do |t|
    t.string   "His_Nombre"
    t.text     "His_Descripcion"
    t.integer  "His_Prioridad"
    t.integer  "His_Esfuerzo"
    t.integer  "proyecto_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "sprint_id"
  end

  add_index "historiausuarios", ["proyecto_id"], name: "index_historiausuarios_on_proyecto_id"
  add_index "historiausuarios", ["sprint_id"], name: "index_historiausuarios_on_sprint_id"

  create_table "miembros", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "proyecto_id"
    t.integer  "rol_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "miembros", ["proyecto_id"], name: "index_miembros_on_proyecto_id"
  add_index "miembros", ["rol_id"], name: "index_miembros_on_rol_id"
  add_index "miembros", ["user_id"], name: "index_miembros_on_user_id"

  create_table "proyectos", force: :cascade do |t|
    t.string   "proy_nombre"
    t.text     "proy_descripcion"
    t.date     "proy_fechainicio"
    t.date     "proy_fechafinalizacion"
    t.string   "proy_estado"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "proyectos", ["user_id"], name: "index_proyectos_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rols", force: :cascade do |t|
    t.text     "rol_nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.text     "sprint_nombre"
    t.date     "sprint_fechainicio"
    t.date     "sprint_fechafinalizacion"
    t.integer  "proyecto_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "sprint_estado"
  end

  add_index "sprints", ["proyecto_id"], name: "index_sprints_on_proyecto_id"

  create_table "tareas", force: :cascade do |t|
    t.string  "Asunto"
    t.string  "Descripcion"
    t.string  "Estado"
    t.integer "Estimacion"
    t.integer "sprint_id"
    t.integer "historiausuario_id"
    t.integer "user_id"
  end

  add_index "tareas", ["historiausuario_id"], name: "index_tareas_on_historiausuario_id"
  add_index "tareas", ["sprint_id"], name: "index_tareas_on_sprint_id"
  add_index "tareas", ["user_id"], name: "index_tareas_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "apodo"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
