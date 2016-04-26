class Headphone
  attr_reader :sku,
              :name,
              :customer_avg_review,
              :short_description,
              :sale_price,
              :image_url

  def initialize(data)
    @sku                 = data[:sku]
    @name                = data[:name]
    @customer_avg_review = data[:customerReviewAverage]
    @short_description   = data[:shortDescription]
    @sale_price          = data[:salePrice]
    @image_url           = data[:image]
  end

  def self.find_by(params)
    service = BestBuyService.new
    headphones = service.headphones(params)
    headphones[:products].map do |headphone|
      new(headphone)
    end
  end
end
