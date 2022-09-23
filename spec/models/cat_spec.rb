require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "is too short (minimum is 10 characters)" do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
    expect(cat.errors[:enjoys]).to include("is too short (minimum is 10 characters)")
  end
  it 'should validate name' do
    cat = Cat.create
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'should validate age' do
    cat = Cat.create
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'should validate enjoys' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'should validate image' do
    cat = Cat.create
    expect(cat.errors[:image]).to_not be_empty
  end
end
