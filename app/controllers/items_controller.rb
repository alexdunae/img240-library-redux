class ItemsController < ApplicationController
  before_action :lookup_item_type
  before_action :lookup_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @item_type.items.order('title ASC')
  end

  def new
    @item = @item_type.items.new
  end

  def show
  end

  def edit
  end

  def create
    @item = @item_type.items.new(item_params)

    if @item.save
      @item.fetch_image
      redirect_to root_path, notice: 'Success! We added your thing!'
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
      @item.fetch_image
      redirect_to root_path, notice: "Success! We saved #{@item.title}!!!!"
    else
      render 'new'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: 'Poof!'
  end

  private

  # this is run before every action is started
  def lookup_item_type
    @item_type = ItemType.find(params[:item_type_id])
  end

  def lookup_item
    @item = @item_type.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :completed_on)
  end
end
