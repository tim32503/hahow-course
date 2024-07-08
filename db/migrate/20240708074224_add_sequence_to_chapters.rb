class AddSequenceToChapters < ActiveRecord::Migration[7.1]
  def change
    add_column :chapters, :sequence, :integer, default: 0
    add_column :units, :sequence, :integer, default: 0
  end
end
