class CreateWordPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :word_pairs do |t|
      t.integer :word_ids, array: true, default: []

      t.timestamps
    end
  end
end
