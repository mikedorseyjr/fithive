class Workout
  include Mongoid::Document
  attr_accessible :name, :trainer, :activities_attributes

  field :name, :type => String, :default => "Cardio"
  field :activity_id, :type => Integer
  field :trainer, :type => Boolean

  ## Relationships
  belongs_to :user
  has_many   :activities, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :activities, :reject_if => :all_blank, 
                                :allow_destroy => true

  def creater_by_trainer
  	if current_user.trainer == True
  		self.workout.trainer = True
  	end
  end
end

class Activity
	include Mongoid::Document

	attr_accessible :name, :sets, :reps
	field :name, 		:type => String
	field :sets,        :type => Integer
	field :reps,        :type => Integer

	## Relationships
	belongs_to :workout

end