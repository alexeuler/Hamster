class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :phone
      t.string :address
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
