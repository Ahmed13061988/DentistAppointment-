class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
        t.datetime :date
        t.datetime :time
        t.string :title
        t.references :patient, null: false, foreign_key: true
        t.references :dentist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
