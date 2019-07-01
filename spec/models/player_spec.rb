require 'rails_helper'

RSpec.describe Player, type: :model do
  subject do
    create(:player)
  end

  describe 'when saving' do
    context 'with valid attributes' do
      it 'saves successfully' do
        expect(subject).to be_valid
      end
    end

    context 'with missing attributes' do
      it 'is not valid without a campaign' do
        subject.campaign = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a user' do
        subject.user = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a role' do
        subject.role = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid when the role is not correct' do
        subject.role = 'INVALID'
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'when observing relationships' do
    it 'belongs to a campaign' do
      expect(subject.campaign).to eq(Campaign.first)
    end

    it 'belongs to a user' do
      expect(subject.user).to eq(User.first)
    end
  end
end
