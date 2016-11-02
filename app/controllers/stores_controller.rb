class StoresController < ApplicationController
  def index
    best_buy = BestBuyService.new(params[:zip])
    @stores = best_buy.stores_near_zip
    @total = best_buy.total
  end
end
