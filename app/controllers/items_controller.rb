class ItemsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy   
    
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item creado!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
    
  def destroy
    @item.destroy
    flash[:success] = "Item borrado"
    redirect_to request.referrer || root_url
  end
    
 private

    def item_params
      params.require(:item).permit(:content, :price, :company, :enddate)
    end
    
    def correct_user
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
    
end
