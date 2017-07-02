class WelcomeController < ApplicationController
  def index
    # if params["start_date"] == "2015-01-01" && params["end_date"] == "2016-01-01" && params["region"] == "Angus"
    #   @new_inflation = 142142.7644*(102.7203033/100.7151099)
    #   # print new_inflation
    # else
    #   p "do nothing"
    # end
      @start_index = UkHousePriceIndex.find_by(region: params["region"], date: params["start_date"])
      @end_index = UkHousePriceIndex.find_by(region: params["region"], date: params["end_date"])

      @start_price = params["start_price"].to_i

      @new_inflation = if @end_index != nil
        (@start_price * (@end_index.price_index/@start_index.price_index)).round
      end
  end
end
