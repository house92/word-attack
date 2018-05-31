class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps
    end

    change_table :words do |t|
      t.references :language, foreign_key: true
    end
  end
end
