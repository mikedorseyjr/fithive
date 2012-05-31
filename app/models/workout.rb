



class Workout
  include Mongoid::Document
  attr_accessible :name, :trainer, :activities_attributes

  field :name,        :type => String, :default => "Cardio"
  field :activity_id, :type => Integer
  field :trainer,     :type => Boolean
  field :commited,    :type => Boolean

  ## Relationships
  belongs_to :user
  belongs_to :routine
  has_many   :activities, :autosave => true, :dependent => :destroy
   accepts_nested_attributes_for :workouts, :reject_if => :all_blank, 
                                :allow_destroy => true

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
	attr_accessible :name, :weight, :sets, :reps


	field :name, 		    :type => String
  field :type,        :type => String
  field :weight,      :type => Integer
	field :sets,        :type => Integer
	field :reps,        :type => Integer
  field :notes,       :type => String

  #Day
  #time duration


	## Relationships
	belongs_to :workout

end