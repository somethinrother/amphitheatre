require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    create(:event)
  end

  describe 'when saving' do
    context 'with valid attributes' do
      it 'saves successfully' do
        expect(subject).to be_valid
      end
    end

    context 'with missing attributes' do
      it 'is not valid without a chapter' do
        subject.chapter = nil
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
    it 'belongs to a chapter' do
      expect(subject.chapter).to eq(Chapter.first)
    end
  end

  describe 'when serializing to arrays' do
    it 'character_ids can accept strings' do
      subject.character_ids << '1'
      expect(subject).to be_valid
      expect(subject.character_ids).to match_array(['11', '12', '13', '1'])
    end

    it 'location_ids can accept strings' do
      subject.location_ids << '1'
      expect(subject).to be_valid
      expect(subject.location_ids).to match_array(['14', '15', '16', '1'])
    end
  end
end
