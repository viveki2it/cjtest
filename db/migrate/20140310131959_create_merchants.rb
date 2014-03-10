class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :advertiser_id
      t.string :advertiser_name
      
      t.timestamps
    end
  end
end
