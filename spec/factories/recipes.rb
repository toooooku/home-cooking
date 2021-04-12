FactoryBot.define do
  factory :recipe do
    title {Faker::Lorem.sentence}
    cooking_recipe{"レシピ"}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end