class ActivityController < ApplicationController
  def create
  	@workout = Workout.find(params[:workout_id])
  	@activity = @workout.activities.create!(params[:activity])
  	redirect_to @workout, :notice => "Activities added to workout"
  end
end
