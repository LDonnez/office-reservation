class AddSettingsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :settings, :jsonb, default: '{}'
  end
end
