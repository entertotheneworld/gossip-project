class RemoveColumnContentToCity < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :content, :text
  end
end
