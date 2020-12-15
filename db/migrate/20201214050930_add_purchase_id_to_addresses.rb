class AddPurchaseIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :purchase, null: false, foreign_key: true
  end
end
