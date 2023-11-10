# create coins herda de activeRecord
class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    # nome da tabela
    create_table :coins do |t|
      t.string :description
      t.string :acronym
      t.string :url
      # created_at e updated_at
      t.timestamps
    end
  end
end
