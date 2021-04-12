FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { '1a' +Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
  end
end