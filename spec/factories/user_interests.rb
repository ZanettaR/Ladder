FactoryGirl.define do
  factory :interest, class: 'UserInterest' do
    user
    tag
  end
end
