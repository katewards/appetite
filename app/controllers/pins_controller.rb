class PinsController < ApplicationController
	  

	def index

  	# @pins = Pin.near "London"

  	# if the user has searched for a location
  	# search near the param they typed in
  	# else show all the places near london
  	# the param they've searched for is params[:location]

  		if params[:location].present?
  			# search for the pins near params[:location]
  			@pins = Pin.near(params[:location])

  		else
  			# search for the pins near london
  			@pins = Pin.near "London"

  		end

 	end


	def new


	@pin = Pin.new


	end

	def create

		@pin = Pin.new(pins_params)

		if @pin.save 

			redirect_to root_path

		else

			render "new"

		end

	end 

	def pins_params

		params.require(:pin).permit(:name, :address, :description, :latitude, :longitude)

	end


end
