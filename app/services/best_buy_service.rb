class BestBuyService
  def self.stores_near_zip(zip)
    response = conn.get do |req|
      req.url "v1/stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['apiKey'] = ENV['best_buy_api']
      req.params['pageSize'] = '15'
    end 

    JSON.parse(response.body)
  end
  
  private
    def self.conn
      Faraday.new(url: 'https://api.bestbuy.com/')
    end
end
