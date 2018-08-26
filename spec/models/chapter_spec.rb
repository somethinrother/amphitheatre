require 'rails_helper'

RSpec.describe Chapter, type: :model do
  subject do
    create(:chapter)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a campaign' do
    subject.campaign = nil
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

  it 'can own a blue book' do
    BlueBook.create(
      chapter: subject,
      title: "My character's crummy day",
      body: 'it sucked'
    )
    expect(subject.blue_books.count).to eq(1)
  end
end
