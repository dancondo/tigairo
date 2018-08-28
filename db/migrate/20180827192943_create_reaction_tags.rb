class CreateReactionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :reaction_tags do |t|
      t.string :name
      t.string :photo_path

      t.timestamps
    end
  end
end
