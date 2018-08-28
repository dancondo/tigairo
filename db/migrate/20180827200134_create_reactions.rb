class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.string :reaction_target_name
      t.references :reaction_target, polymorphic: true
      t.references :reaction_tag, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
