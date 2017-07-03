class UkHousePriceIndex < ApplicationRecord
  def self.inflation(region, start_date, end_date)

    start_index = UkHousePriceIndex.find_by(region: region, date: start_date)
    end_index = UkHousePriceIndex.find_by(region: region, date: end_date)

    if start_index != nil && end_index != nil
      end_index.price_index/start_index.price_index
    else
      nil
    end

  end

end
