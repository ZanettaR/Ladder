require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'factory' do
    it 'is valid' do
      expect(FactoryGirl.build(:tag)).to be_valid
    end
  end

  context 'name' do
    it 'is present' do
      expect(FactoryGirl.build(:tag, name: nil)).to be_invalid
    end

    it 'is momre than or equal to 2 characters' do
      expect(FactoryGirl.build(:tag, name: ' a ')).to be_invalid
    end

    it 'is less than or equal to 50 characters' do
      expect(FactoryGirl.build(:tag, name: Faker::Lorem.characters(51))).to be_invalid
    end
  end

  context "association" do
    it "with many user interests" do
      should have_many(:user_interests)
    end

    it "with many user specialties" do
      should have_many(:user_specialties)
    end
  end
end
