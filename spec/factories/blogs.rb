FactoryBot.define do
  factory :blog do
    title {"リクエスト料理"}
    content {"サンプル"}
    start_time {"2021-01-01"}
    association :user
  end
end