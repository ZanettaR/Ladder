class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, default: '', null: false
      t.timestamps
    end
  end
end
