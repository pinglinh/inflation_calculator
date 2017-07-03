class WelcomeController < ApplicationController
  def index
    @start_price = params["start_price"].to_i
    inflation = UkHousePriceIndex.inflation(
      params["region"],
      params["start_date"],
      params["end_date"]
    )
    @new_price = if inflation != nil
      (@start_price * inflation).round
    end
  end
end
