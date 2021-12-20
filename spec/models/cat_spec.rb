require 'rails_helper'

RSpec.describe Cat, type: :model do
  before :example do
    @cat = FactoryBot.build(:cat)
  end
  it "name is valid" do
    expect(@cat).to be_valid
  end
  it "eye_color is valid" do
    expect(@cat).to be_valid
  end
  it "name is not valid" do
    @cat.name = ''
    expect(@cat).not_to be_valid
  end
  it "eye_color is not valid" do
    @cat.eye_color = ''
    expect(@cat).not_to be_valid
  end
end
