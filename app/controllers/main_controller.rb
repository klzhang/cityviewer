require_relative "../services/weather_service"

class MainController < ApplicationController
	def index
		if(not params[:city].nil?)
			if (City.all[params[:city].to_sym].nil?)
				@w = WeatherService.get(params[:city])
				if @w
					city = City.new(
						name: params[:city],
						landmark: "N/A",
						population: 0,
						weather: @w						
						)
					city.save
				end
			end
		end	
	end
end

