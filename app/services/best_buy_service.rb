class BestBuyService
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
    connection.params["apiKey"] = ENV["BEST_BUY_SECRET"]
    connection.params["format"] = "json"
    connection.params["pageSize"] = "15"
  end

  def headphones(params)
  end
end
