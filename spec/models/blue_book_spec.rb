require 'rails_helper'

RSpec.describe BlueBook, type: :model do
  subject do
    create(:blue_book)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

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
