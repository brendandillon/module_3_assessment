class StoresController < ApplicationController
  def index
    near_zip = BestBuyService.stores_near_zip(params[:zip])
    @stores = near_zip['stores']
    @total = near_zip['total']
  end
end
