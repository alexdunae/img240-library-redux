class Item < ActiveRecord::Base
  belongs_to :item_type

  def completed?
    !completed_on.nil?
  end
end
