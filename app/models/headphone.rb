class Headphone
  attr_reader :sku,
              :name,
              :customer_avg_review,
              :short_description,
              :sale_price,
              :image_url

  def initialize(data)
    @sku = ..
    @name = ..
    @customer_avg_review = ..
    @short_description = ..
    @sale_price = ..
    @image_url = ..
  end

  def self.find_by(params)
    service = BestBuyService.new
    headphones = service.headphones(name: params[:name])
    headphones[:producuts].map do |headphone|
      new(headphone)
    end
  end
end
