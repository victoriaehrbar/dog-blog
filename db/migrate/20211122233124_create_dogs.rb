class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :mood
      t.integer :weight
      t.string :breed
      t.integer :breed_id
      t.integer :user_id

      t.timestamps
    end
  end
end
