class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t|
      t.string :title
      t.text :content
      t.integer :training_score
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
