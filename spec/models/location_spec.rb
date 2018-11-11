require 'rails_helper'

RSpec.describe Location, type: :model do
  subject do
    create(:location)
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

      it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a description' do
        subject.description = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'when observing relationships' do
    it 'belongs to a campaign' do
      expect(subject.campaign).to eq(Campaign.first)
    end
  end
end
