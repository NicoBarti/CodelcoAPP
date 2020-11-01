# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_01_174321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contactos", force: :cascade do |t|
    t.string "tipo_contacto"
    t.string "parentesco"
    t.date "fecha_investigacion"
    t.integer "episode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "rut"
    t.string "nombre"
    t.index ["episode_id"], name: "index_contactos_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "folio"
    t.string "tipo_ingreso"
    t.datetime "fecha_ingreso"
    t.integer "contactos_laborales"
    t.integer "contactos_no_laborales"
    t.string "presentacion"
    t.date "inicio_sintomas"
    t.date "inicio_cuarentena"
    t.date "fin_cuarentena"
    t.date "fin_cuarentena_codelco"
    t.string "origen_contagio"
    t.datetime "cierre"
    t.integer "trabajador_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "abierto"
    t.string "cambioSeguimiento"
    t.decimal "rut_indice"
    t.index ["trabajador_id"], name: "index_episodes_on_trabajador_id"
  end

  create_table "seguimientos", force: :cascade do |t|
    t.string "tipo_aislamiento"
    t.string "estado_seguimiento"
    t.boolean "hospitalizacion"
    t.boolean "ventilacion"
    t.boolean "falleceresp"
    t.string "estadoegreso"
    t.text "evolucion"
    t.integer "episode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "fecha_seguimiento"
    t.index ["episode_id"], name: "index_seguimientos_on_episode_id"
  end

  create_table "sintomas", force: :cascade do |t|
    t.date "inicio_sintomas"
    t.boolean "fiebre"
    t.boolean "cefalea"
    t.boolean "disnea"
    t.boolean "tos"
    t.boolean "odinofagia"
    t.boolean "taquipnea"
    t.boolean "cianosis"
    t.boolean "mialgia"
    t.boolean "dolorabdominal"
    t.boolean "diarrea"
    t.boolean "anosmia"
    t.boolean "agueusia"
    t.boolean "diabetes"
    t.boolean "hipertension"
    t.string "otras"
    t.integer "episode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episode_id"], name: "index_sintomas_on_episode_id"
  end

  create_table "tests", force: :cascade do |t|
    t.date "fecha_antigeno"
    t.string "res_antigeno"
    t.date "fecha_pcr"
    t.string "res_pcr"
    t.date "fecha_pcr_pac"
    t.string "res_pcr_pac"
    t.integer "episode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episode_id"], name: "index_tests_on_episode_id"
  end

  create_table "trabajadors", force: :cascade do |t|
    t.string "sexo"
    t.date "fecha_nac"
    t.integer "edad"
    t.string "region"
    t.string "comuna"
    t.string "prevision"
    t.string "nacionalidad"
    t.string "division"
    t.string "tipo_trabajador"
    t.string "empresa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rut"
    t.string "nombres"
    t.string "apellido1"
    t.string "apellido2"
  end

  add_foreign_key "contactos", "episodes"
  add_foreign_key "episodes", "trabajadors"
  add_foreign_key "seguimientos", "episodes"
  add_foreign_key "sintomas", "episodes"
  add_foreign_key "tests", "episodes"
end
