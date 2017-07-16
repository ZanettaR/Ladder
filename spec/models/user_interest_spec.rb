require 'rails_helper'

RSpec.describe UserInterest, type: :model do
  context 'factory' do
    it 'is valid' do
      expect(FactoryGirl.build(:interest)).to be_valid
    end
  end

  context 'user_id' do
    it 'is present' do
      expect(FactoryGirl.build(:interest, user_id: nil)).to be_invalid
    end
  end

  context 'tag_id' do
    it 'is present' do
      expect(FactoryGirl.build(:interest, tag_id: nil)).to be_invalid
    end
  end

  context "association" do
    it "with belongs_to tag" do
      should belong_to(:tag)
    end

    it "with belong_to user" do
      should belong_to(:user)
    end
  end
end
