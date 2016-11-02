class BestBuyService

  def initialize(zip)
    @zip = zip
  end

  def find_stores
    response = conn.get do |req|
      req.url "v1/stores(area(#{@zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['apiKey'] = ENV['best_buy_api']
      req.params['pageSize'] = '15'
    end 
    JSON.parse(response.body, symbolize_names: true)
  end

  def stores_near_zip
    raw_stores = find_stores[:stores]

    sort_into_stores(raw_stores)
  end

  def total
    find_stores[:total]
  end

  private
    def conn
      Faraday.new(url: 'https://api.bestbuy.com/')
    end

    def sort_into_stores(raw_stores)
      raw_stores.map do |raw_store|
        Store.new(raw_store)
      end
    end
end
