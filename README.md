# Inflation Calculation

A simple web service which calculates average inflation UK house price based on user input start price, from date and to date and region (borough).

# Instructions

MAKE SURE YOU HAVE RUBY 2.3~ INSTALLED

1. Save the zip file to your local environment
2. CD (change directory) into the directory where you saved it
3. Run bundle install
4. Run `bundle exec rails db:migrate RAILS_ENV=development` (creating empty tables in the database with the column names set in schema.rb)
5 The next step may take 5 or so mins to do:
    run `bundle exec rails csv:import`
6. WAIT
7. Once finished run `bundle exec rails server`
8. Type `localhost:3000` into your local browser to view the web service
9. Type in the price you bought your house at originally
10. Select 1st of the month only for from and to dates
11. Select region
12. Click sbumit and this will tell you the estimated inflated price for your house

# Future Improvements

1. Make the user only choose month and year as the date always has to be first of the month and this can cause accessibility issues
2. Add CSS - responsive design
3. Add animation
4. PROBLEM!!! Not all regions have the same date range for the index therefore maybe make the user choose the region first and alert them of the date range before they input the dates - or just list the range available when the user clicks to select dates
