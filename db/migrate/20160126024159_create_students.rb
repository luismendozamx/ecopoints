class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :clave_unica
      t.integer :points, default: 0
      t.string :email

      t.timestamps null: false
    end

    add_index :students, :clave_unica
  end
end
