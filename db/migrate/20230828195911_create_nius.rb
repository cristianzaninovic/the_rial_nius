class CreateNius < ActiveRecord::Migration[7.0]
  def change
    create_table :nius do |t|
      t.references :nius_user, null: false, foreign_key: true
      t.string :title
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
