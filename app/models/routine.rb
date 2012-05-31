## Make a way for users to look through ready made default workouts and ATTACH
## to their profile
class Routine
  include Mongoid::Document

  field :name,          :type => String, :default => "Routine"
  field :level,         :type => String, :default => "Intermediate"
  field :day_count,     :type => Integer, :default => 5
  field :description,   :type => Integer
  field :start_date,    :type => DateTime
  field :end_date,      :type => DateTime
  field :completed,     :type => Boolean


  ## Relationships
  belongs_to :user
  has_many :workouts
  accepts_nested_attributes_for :workouts, :reject_if => :all_blank, 
                                :allow_destroy => true
end