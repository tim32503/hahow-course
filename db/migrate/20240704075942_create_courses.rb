class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :lecturer_name
      t.text :description

      t.timestamps
    end
  end
end
