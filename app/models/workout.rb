class Workout
  include Mongoid::Document
  field :name, :type => String
  field :activity_id, :type => Integer
  field :user_id, :type => Integer
  field :trainer, :type => Boolean
end
