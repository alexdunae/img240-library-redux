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
    @item = Item.new(item_params)
    if @item.save
      @item.fetch_image
      redirect_to root_path, notice: 'Success! We added your thing!'
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      @item.fetch_image
      redirect_to root_path, notice: "Success! We saved #{@item.title}!!!!"
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: 'Poof!'
  end

  private

  def item_params
    params.require(:item).permit(:title, :completed_on, :item_type_id)
  end
end
