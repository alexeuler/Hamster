class RenameLeadsToHamsters < ActiveRecord::Migration
  def change
    rename_table :leads, :hamsters
  end
end
