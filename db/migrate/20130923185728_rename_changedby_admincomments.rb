class RenameChangedbyAdmincomments < ActiveRecord::Migration
  def change
    rename_column :leads, :changedby, :updated_by
    rename_column :leads, :admincomments, :admin_comments
  end
end
