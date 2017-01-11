class RemoveDateFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :date, :date
  end
end
