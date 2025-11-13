require 'rails_helper'

RSpec.describe Item, type: :model do
  it "needs to have an english name that is unique" do
    test_item = Item.create eng_name: "Water bottle"
    second_item = Item.create eng_name: "Water bottle"

    expect(test_item).to be_valid
    expect(second_item).to_not be_valid
  end
end
