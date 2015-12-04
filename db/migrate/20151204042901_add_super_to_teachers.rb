class AddSuperToTeachers < ActiveRecord::Migration
  def change
     add_column :teachers, :super, :boolean, :default => false
  end
end
