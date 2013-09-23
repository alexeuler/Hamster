class AddStatusChangedbyAdmincommemtsToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :status, :string
    add_column :leads, :changedby, :string
    add_column :leads, :admincomments, :string
  end
end
