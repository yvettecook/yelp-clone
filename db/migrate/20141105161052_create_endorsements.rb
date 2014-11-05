class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.belongs_to :review, index: true

      t.timestamps
    end
  end
end
