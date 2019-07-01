require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject do
    create(:campaign)
  end

  describe 'when saving' do
    context 'with valid attributes' do
      it 'saves successfully' do
        expect(subject).to be_valid
      end
    end

    context 'with missing attributes' do
      it 'is not valid without a user' do
        subject.user = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a title' do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a description' do
        subject.description = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'when observing relationships' do
    it 'belongs to a user' do
      expect(subject.user).to eq(User.first)
    end

    it 'can own a chapter' do
      create(:chapter, campaign: subject)
      expect(subject.chapters.count).to eq(1)
    end

    it 'can own a character' do
      create(:character, campaign: subject)
      expect(subject.characters.count).to eq(1)
    end
  end
end
