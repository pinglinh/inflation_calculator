require 'csv'

class WelcomeController < ApplicationController
  def index
    if params["start_date"] == "2015-01-01" && params["end_date"] == "2016-01-01" && params["region"] == "Angus"
      @new_inflation = 142142.7644*(102.7203033/100.7151099)
      # print new_inflation
    else
      p "do nothing"
    end
    CSV.foreach(filename, :headers => true) do |row|
    Moulding.create!(row.to_hash)
  end

  end
end
