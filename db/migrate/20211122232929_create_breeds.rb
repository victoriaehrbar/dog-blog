class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :breed_name

      t.timestamps
    end
  end
end
