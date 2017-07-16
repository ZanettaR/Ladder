require 'rails_helper'

RSpec.describe User, type: :model do
  context 'factory' do
    it 'is valid' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context 'first name' do
    it 'is present' do
      expect(FactoryGirl.build(:user, first_name: nil)).to be_invalid
    end

    it 'is momre than or equal to 2 characters' do
      expect(FactoryGirl.build(:user, first_name: ' a ')).to be_invalid
    end

    it 'is less than or equal to 30 characters' do
      expect(FactoryGirl.build(:user, first_name: Faker::Lorem.characters(31))).to be_invalid
    end

    it 'does not contain numbers' do
      expect(FactoryGirl.build(:user, first_name: 'john24')).to be_invalid
    end

    it 'does not contain special characters' do
      expect(FactoryGirl.build(:user, first_name: '...') ).to be_invalid
      expect(FactoryGirl.build(:user, first_name: 'john/*') ).to be_invalid
      expect(FactoryGirl.build(:user, first_name: 'jo-hn') ).to be_invalid
    end
  end

  context 'last name' do
    it 'is present' do
      expect(FactoryGirl.build(:user, last_name: nil)).to be_invalid
    end

    it 'is momre than or equal to 2 characters' do
      expect(FactoryGirl.build(:user, last_name: ' a ')).to be_invalid
    end

    it 'is less than or equal to 30 characters' do
      expect(FactoryGirl.build(:user, last_name: Faker::Lorem.characters(31))).to be_invalid
    end

    it 'does not contain numbers' do
      expect(FactoryGirl.build(:user, last_name: 'john24')).to be_invalid
    end

    it 'does not contain special characters' do
      expect(FactoryGirl.build(:user, last_name: '...') ).to be_invalid
      expect(FactoryGirl.build(:user, last_name: 'john/*') ).to be_invalid
      expect(FactoryGirl.build(:user, last_name: 'jo-hn') ).to be_invalid
    end
  end

  context 'email' do
    it 'is present' do
      expect(FactoryGirl.build(:user, email: nil)).to be_invalid
    end

    it 'is unique' do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:user, email: user.email.upcase)).to be_invalid
    end

    it 'is a formatted' do
      expect(FactoryGirl.build(:user, email: '@.com')).to be_invalid
      expect(FactoryGirl.build(:user, email: 'mail.com')).to be_invalid
      expect(FactoryGirl.build(:user, email: 'email')).to be_invalid
    end
  end

  context 'password' do
    it 'is present' do
      expect(FactoryGirl.build(:user, password: nil)).to be_invalid
    end

    it 'is atleast 8 characters long' do
      expect(FactoryGirl.build(:user, password: 'abc')).to be_invalid
    end

    it 'is atmost 128 characters long' do
      expect(
        FactoryGirl.build(:user, password: Faker::Lorem.characters(129))
      ).to be_invalid
    end
  end

  context 'photo' do
    it 'is present' do
      expect(FactoryGirl.build(:user, photo: nil)).to be_invalid
    end

    it 'is valid' do
      skip
      expect(FactoryGirl.build(:user, photo: 'plum')).to be_invalid
    end
  end

  context 'birth_year' do
    it 'is present' do
      expect(FactoryGirl.build(:user, birth_year: nil)).to be_invalid
    end

    it 'is valid' do
      expect(FactoryGirl.build(:user, birth_year: 1951)).to be_invalid
      expect(FactoryGirl.build(:user, birth_year: Date.today.year - 15)).to be_invalid
    end
  end

  context 'gender' do
    it 'is present' do
      expect(FactoryGirl.build(:user, gender: nil)).to be_invalid
    end

    it 'is valid' do
      expect(FactoryGirl.build(:user, gender: 'plum')).to be_invalid
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
