require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject do
    create(:campaign)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

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

  it 'belongs to a user' do
    expect(subject.user).to eq(User.first)
  end

  it 'can own a setting detail' do
    create(:setting_detail, campaign: subject)
    expect(subject.setting_details.count).to eq(1)
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
