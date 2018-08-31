class AddCountryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :country, foreign_key: true
  end
end
