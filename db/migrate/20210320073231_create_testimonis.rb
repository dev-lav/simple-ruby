class CreateTestimonis < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonis do |t|
      t.string :name
      t.string :job_title
      t.text :testimoni
      t.string :image

      t.timestamps
    end
  end
end
