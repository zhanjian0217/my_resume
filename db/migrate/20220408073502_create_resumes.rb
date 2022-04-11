class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
      # created_at
      # updateed_at
    end
  end
end
