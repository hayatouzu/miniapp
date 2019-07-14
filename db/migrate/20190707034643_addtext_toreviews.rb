class AddtextToreviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :text, :text
  end
end
