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

ActiveRecord::Schema.define(version: 20_211_109_172_333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bills', force: :cascade do |t|
    t.float 'valor'
    t.date 'data_vencimento'
    t.bigint 'enrollment_id', null: false
    t.text 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['enrollment_id'], name: 'index_bills_on_enrollment_id'
  end

  create_table 'enrollments', force: :cascade do |t|
    t.float 'valor_curso'
    t.integer 'qtd_bills'
    t.integer 'dia_vencimento_bill'
    t.text 'nome_curso'
    t.bigint 'institution_id', null: false
    t.bigint 'student_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['institution_id'], name: 'index_enrollments_on_institution_id'
    t.index ['student_id'], name: 'index_enrollments_on_student_id'
  end

  create_table 'institutions', force: :cascade do |t|
    t.text 'nome'
    t.text 'cnpj'
    t.text 'tipo'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'students', force: :cascade do |t|
    t.text 'nome'
    t.text 'cpf'
    t.date 'data_nascimento'
    t.integer 'celular'
    t.text 'genero'
    t.text 'meio_pagamento_bills'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'bills', 'enrollments'
  add_foreign_key 'enrollments', 'institutions'
  add_foreign_key 'enrollments', 'students'
end
