class ItemsController < ApplicationController
  def index
    @items = Item.all.order('title ASC')
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @item.redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :completed_on, :item_type_id)
  end
end
