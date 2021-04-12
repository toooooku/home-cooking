FactoryBot.define do
  factory :refrigerator do
    foodstuff {"キャベツ"}
    association :user
  end
end