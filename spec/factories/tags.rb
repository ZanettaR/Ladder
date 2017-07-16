FactoryGirl.define do
  factory :tag do
    name { Faker::Lorem.characters(2..50) }
  end
end
