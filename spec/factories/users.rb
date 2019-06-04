FactoryBot.define do

  factory :user do
    name                   {"abe"}
    sequence(:email) {Faker::Internet.email}
    password               {"0000000"}
    encrypted_password     {"0000000"}
    created_at             {"2019-5-17"}
    updated_at             {"2019-5-18"} 
  end
end
