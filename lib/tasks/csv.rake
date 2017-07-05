require 'csv'
require 'open-uri'

namespace :csv do
  desc "Imports UkHousePriceIndex csv file"
  task import: :environment do
    url = 'http://publicdata.landregistry.gov.uk/market-trend-data/house-price-index-data/UK-HPI-full-file-2016-05.csv'
    # path = 'UK-HPI-full-file-2016-05.csv'

    UkHousePriceIndex.delete_all
    CSV.foreach(open(url), :headers => true) do |row|
      UkHousePriceIndex.create(
        region: row['RegionName'],
        date: row['Date'],
        price_index: row['Index'],
      )
    end
  end
end
