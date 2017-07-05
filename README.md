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


if you do bundle exec it will run the version from the GEMFILE rather than the stuff u have installed in your local env



MAKE SURE YOU HAVE RUBY 2.3 INSTALLED 


1. Save the zip file to your local environment
2. CD into the directory where you saved it
3. Run bundle install
4. Run `bundle exec rails db:migrate RAILS_ENV=development` (creating empty tables in the database with the column names set in schema.rb)
5 The next step may take 5 or so mins to do:
run `bundle exec rails csv:import`
6. WAIT
7. Once finished run `bundle exec rails server`
8. go to localhost:3000 to view this
9. type in the price you bought your house at 
10. select 1st of the month only for from and to dates
11. Select region 
12. click sbumit and this will tell you the estimated inflated price for your house 