class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :code
      t.string :authors
      t.string :title
      t.string :publisher
      t.integer :year
      t.text :notes
      t.string :location

      t.timestamps
    end
    add_index :books, :code, unique: true
  end
end
