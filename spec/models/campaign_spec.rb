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

  it 'can own a setting detail' do
    SettingDetail.create(
      campaign: subject,
      title: 'year',
      description: '2018'
    )
    expect(subject.setting_details.count).to eq(1)
  end

  it 'can own a chapter' do
    Chapter.create(
      campaign: subject,
      title: 'The Eye of the World',
      description: 'Sweet book'
    )
    expect(subject.chapters.count).to eq(1)
  end
end
