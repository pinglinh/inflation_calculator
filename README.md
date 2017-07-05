# Inflation Calculation

Calculates average inflation UK house price based on user input start price, from date, end date and region (borough).

Download the repo to your local environment, cd into it and type `rails server`. Open `localhost:3000` on your browser to view.

1. bin/rails db:migrate RAILS_ENV=development
2. Next we need to import the data into the database
3. Run `rails cvs:import`
4. Make sure csv.rake is in the link/tasks
5. Following code should be inside

```
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
```


If this wasn't in the folder, you would have to create the rake file using the following command:

`$ rails generate task csv import`

Once the code is inside this file run

`rails -T` to get all the available tasks

then `rails csv:import` to import all the data into database

if break is used before `price_index: row['Index'],)` then this will only import 1 row of data and this way you can check whether it is the correct data that's being imported...then when doing the full import make sure to delete the data you just iported by doing `UkHousePriceIndex.delete_all` above CSV.foreach.....blah blah

to check whether it has been set up crrecly `bundle exec rails console`

then run `UkHousePriceIndex.count`









Please note that if you choose a date from and to it needs choose the 1st day of the month and not any other day...the year in range is _________

Otherwise this will not work 

must add a test for this feature

clean up this readme

