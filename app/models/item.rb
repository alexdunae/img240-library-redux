class Item < ActiveRecord::Base
  belongs_to :item_type

  validates :title, presence: true, length: { minimum: 2 }

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

  def fetch_image
    self.image_url = ImageFetcher.new.fetch(title)
    save
  end
end
