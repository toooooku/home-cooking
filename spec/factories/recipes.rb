FactoryBot.define do
  factory :recipe do
    title {"野菜炒め"}
    cooking_recipe{"レシピ"}
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end