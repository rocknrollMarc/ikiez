class AddAmountToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :decimal
  end
end
