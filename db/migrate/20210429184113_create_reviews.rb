class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment 
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.timestamps

    end
  end
end
