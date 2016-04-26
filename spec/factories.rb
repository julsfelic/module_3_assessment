FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "#{n} Item" }
    sequence(:description) { |n| "#{n} Description" }
    sequence(:image_url) { |n| "/image/#{n}" }
  end
end
