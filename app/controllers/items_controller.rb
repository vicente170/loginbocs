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
      params.require(:item).permit(:content)
      params.require(:item).permit(:price)
      params.require(:item).permit(:company)
      params.require(:item).permit(:enddate)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
    
end
