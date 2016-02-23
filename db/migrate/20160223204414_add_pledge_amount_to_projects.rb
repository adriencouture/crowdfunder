class AddPledgeAmountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pledge_amount, :integer
  end
end
