class RoutinesController < ApplicationController
	def new
		@routine = Routine.new
	end

	def create
		@routine = Routine.create(params[:routine])
	end
end
