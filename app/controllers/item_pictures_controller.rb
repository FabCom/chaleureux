class ItemPicturesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.item_picture.attach(params[:item_picture])
    redirect_to(item_path(@item))
  end
end
