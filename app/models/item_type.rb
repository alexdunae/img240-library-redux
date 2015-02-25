class ItemType < ActiveRecord::Base
  has_many :items, dependent: :nullify
end
