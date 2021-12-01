class JoinTableItemCartsController < ApplicationController

  def new
    cart_id = params[:cart_id]
    item_id = params[:item_id]
    JoinTableItemCart.create(cart_id: cart_id, item_id: item_id)
    redirect_to cart_path(id: cart_id)
  end

  def create
    @item_in_cart = JoinTableItemCart.new(user_id: params[:current_user_id])
    if @item_in_cart.save 
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid cart parameters !'
    end
  end

  def destroy

    if params[:all] == "true" 
      items = JoinTableItemCart.where(item_id: params[:item_id], cart_id: params[:cart_id])
      items.each do |item|
        item.destroy()
      end
    else
      item = JoinTableItemCart.where(item_id: params[:item_id], cart_id: params[:cart_id]).last
      item.destroy()
    end
    redirect_to cart_path(id: params[:cart_id])
  end

  private
  def parameters
    params.require(:join_table_item_carts).permit(:item_id, :card_id)
  end 
end
