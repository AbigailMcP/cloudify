class CreateWordclouds < ActiveRecord::Migration[5.0]
  def change
    create_table :wordclouds do |t|
      t.string :username

      t.timestamps
    end
  end
end
