class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :state
      t.string :city
      t.integer :number_of_houses

      t.timestamps
    end
  end
end
