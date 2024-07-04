class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
