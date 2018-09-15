class ChangeCommentsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :post, foreign_key: true
    change_table :comments do |t|
      t.string :comment_target_name
      t.references :comment_target, polymorphic: true
    end
  end
end
