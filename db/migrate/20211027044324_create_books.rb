class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :sinopsis
      t.date :release_date
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
