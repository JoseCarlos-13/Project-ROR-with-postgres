class RemoveEmailFromOperator < ActiveRecord::Migration[6.0]
  def change
    remove_column :operators, :email
  end
end
