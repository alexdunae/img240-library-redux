class ItemsController < ApplicationController
  def index
    @items = Item.all.order('title ASC')
  end
end
