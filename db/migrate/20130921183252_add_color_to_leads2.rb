class AddColorToLeads2 < ActiveRecord::Migration
  def change
    add_column :leads, :color, :string
  end
end
