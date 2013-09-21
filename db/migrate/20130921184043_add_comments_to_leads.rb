class AddCommentsToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :comments, :string
  end
end
