FactoryGirl.define do
  factory :specialty, class: 'UserSpecialty' do
    user
    tag
  end
end
