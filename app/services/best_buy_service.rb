class BestBuyService
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
    connection.params = {
      "apiKey" => ENV["BEST_BUY_SECRET"],
      "format" => "json",
      "pageSize" => "15"
    }
  end

  def headphones(params)
    if params[:name].split(" ").count > 1
      long_description = params[:name].split
      parse(connection.get("/v1/products(longDescription=#{long_description[0]}*%20#{long_description[1]}*%20#{long_description[2]}*)"))
    else
      parse(connection.get("/v1/products((search=#{params[:name]})&(categoryPath.id=abcat0204000))"))
    end
  end

  private

    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body).deep_symbolize_keys
    end
end
