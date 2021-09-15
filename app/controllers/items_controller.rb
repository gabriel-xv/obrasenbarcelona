class ItemsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
    @edit_item = Item.find(params[:id])
  end

  def update
    @update_item = Item.find(params[:id])
    @update_item.update(item_params)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :comment, :photo)
  end
end
