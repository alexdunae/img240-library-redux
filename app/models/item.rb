class Item < ActiveRecord::Base
  belongs_to :item_type

  def completed?
    !completed_on.nil?
  end

  def item_type_name
    if item_type
      item_type.name
    else
      'No item type'
    end
  end
end
