FactoryBot.define do
  factory :product do
    name {"hello!"}
    image {"hoge.jng"}
    description {"hoge"}
    category_id {1}
    user
  end
end