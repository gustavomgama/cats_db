class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :age
      t.string :weight
      t.string :eye_color

      t.timestamps
    end
  end
end
