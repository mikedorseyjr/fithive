class WorkoutsController < ApplicationController
	respond_to :html, :json
	def new
		@workout = Workout.new
		@workout.activities.build 
	end


	def create
		@workout = current_user.workouts.new(params[:workout])
		if @workout.save!(params[:workout])
			flash[:notice] = 'Workout created' 
			respond_with @workout, :location => workouts_url
		else
			flash[:error] = "Uh oh, chief!"
			respond_with @workout, :location => root_url
		end
	end


	def index
		@workouts = current_user.workouts.find(:all)
	end


	def show
		@workout = Workout.find(params[:id])
		@activities = @workout.activities.find(:all)
	end
end

class ActivitiesController < ApplicationController
	def new
		#@activity = .new

	end

	def create
		@workout = Workout.find(params[:id])
		@activity = @workout.Activity.create!(params[:workout])
	end
end