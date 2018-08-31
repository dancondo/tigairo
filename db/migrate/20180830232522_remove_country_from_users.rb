class RemoveCountryFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :country, foreign_key: true
  end
end
