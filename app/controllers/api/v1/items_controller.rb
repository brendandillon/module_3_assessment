class Api::V1::ItemsController < ApplicationController
  protect_from_forgery except: :create
  def index
    @items = Item.all
    render json: @items
  end
  
  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def destroy
    Item.delete(params[:id])
    render nothing: true, status: 204
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: @item.errors
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
