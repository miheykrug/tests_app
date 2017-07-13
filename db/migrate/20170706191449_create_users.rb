class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :first_name
      t.string :second_name
      t.string :email

      t.timestamps null: false
    end
  end
end
