class AddDescriptionToDentist < ActiveRecord::Migration[6.0]
  def change
      add_column :dentists, :description, :string
  end
end
