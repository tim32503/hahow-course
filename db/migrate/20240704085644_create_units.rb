class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
