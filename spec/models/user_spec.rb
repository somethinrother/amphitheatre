require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    create(:user)
  end

  describe 'when saving' do
    context 'with valid attributes' do
      it 'saves successfully' do
        expect(subject).to be_valid
      end
    end

    context 'with missing attributes' do
      it 'is not valid without a username' do
        subject.username = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a password' do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a password digest' do
        subject.password_digest = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'when observing relationships' do
    it 'can own a campaign' do
      create(:campaign, user: subject)
      expect(subject.campaigns.count).to eq(1)
    end
  end
end
