require_relative "../services/weather_service"

class CitiesController < ApplicationController

	def viewcity
		@name = params[:city]
	end

	def newcity
	end

	def updateget

	end

	def create

		if (params[:population] =~ /^-?[0-9]+$/ and not params[:city].nil?)

			if (City.all[params[:city].to_sym].nil?)
				@w = WeatherService.get(params[:city])
				if @w
					@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
					city = City.new(
						name: params[:city],
						landmark: params[:landmark],
						population: params[:population],
						weather: @w
						)
					city.save
				end
			end
		end

		redirect_to '/cities/view'
	end

	def updatepost
		s = params[:city]

		if (not s.blank?)
			c = City.all[s.to_sym]
			if (not c.nil?)

				c.update(landmark: params[:landmark])
				if (params[:population] =~ /^-?[0-9]+$/)
					c.update(population: params[:population])
				end

			end
		end
		redirect_to '/cities/view'
	end
end



		