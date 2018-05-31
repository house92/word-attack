class CreateWordLists < ActiveRecord::Migration[5.2]
  def change
    create_table :word_lists do |t|
      t.references :word, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
