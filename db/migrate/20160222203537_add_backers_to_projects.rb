class AddBackersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :backer_count, :integer
  end
end
