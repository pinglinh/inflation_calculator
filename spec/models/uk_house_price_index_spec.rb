require 'rails_helper'

RSpec.describe UkHousePriceIndex, type: :model do
  it "start/end dates exist" do
    expect(
      UkHousePriceIndex.inflation("Aberdeenshire", "2006-06-01", "2009-06-01")
    ).to eq(82.0 / 64.0)
  end

  it "end date missing" do
    expect(
      UkHousePriceIndex.inflation("Aberdeenshire", "2006-06-01", "2010-06-01")
    ).to eq(nil)
  end

  it "start date missing" do
    expect(
      UkHousePriceIndex.inflation("Aberdeenshire", "2005-06-01", "2009-06-01")
    ).to eq(nil)
  end

  it "both dates missing" do
    expect(
      UkHousePriceIndex.inflation("Aberdeenshire", "2005-06-01", "2010-06-01")
    ).to eq(nil)
  end
end
