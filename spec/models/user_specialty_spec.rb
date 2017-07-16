require 'rails_helper'

RSpec.describe UserSpecialty, type: :model do
  context 'factory' do
    it 'is valid' do
      expect(FactoryGirl.build(:specialty)).to be_valid
    end
  end

  context 'user_id' do
    it 'is present' do
      expect(FactoryGirl.build(:specialty, user_id: nil)).to be_invalid
    end
  end

  context 'tag_id' do
    it 'is present' do
      expect(FactoryGirl.build(:specialty, tag_id: nil)).to be_invalid
    end
  end

  context "association" do
    it "with many user interests" do
      should belong_to(:tag)
    end

    it "with many user specialties" do
      should belong_to(:user)
    end
  end
end
