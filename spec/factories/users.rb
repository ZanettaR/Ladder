FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    photo { Faker::Name.photo }
    gender { Faker::Name.gender }
    birth_year { Faker::Number.between(Date.today.year - 65, Date.today.year - 16) }
    email { Faker::Internet.email }
    password { 'abcd1234' }

    trait :registerable do
      password_confirmation { password }
    end

    trait :loggeable do
      remember_me { '1' }
    end

    trait :updateable do
      current_password { 'abcd1234' }
    end
  end
end
