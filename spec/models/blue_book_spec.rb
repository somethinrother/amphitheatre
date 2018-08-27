require 'rails_helper'

RSpec.describe BlueBook, type: :model do
  subject do
    create(:blue_book)
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

      it 'is not valid without a body' do
        subject.body = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'when observing relationships' do
    it 'belongs to a chapter' do
      expect(subject.chapter).to eq(Chapter.first)
    end

    it 'belongs to a character' do
      expect(subject.character).to eq(Character.first)
    end
  end
end
