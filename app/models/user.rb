class User
  include Mongoid::Document

  before_save :copy_to_last_weight
  attr_accessible :nickname, :first_name, :last_name, :email, :weight, :last_weight, :height, :password, :password_confirmation, :remember_me
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of          :nickname, :first_name, :last_name, :weight, :height, :goal
  validates_uniqueness_of        :nickname, :email, :case_sensitive => false
  ##  User additional fields
  field :nickname,               :type => String
  field :first_name,             :type => String
  field :last_name,              :type => String
  field :weight,                 :type => Integer
  field :last_weight,            :type => Integer
  field :height,                 :type => String

  field :bodyfat,                :type => String
  field :arm_measurement,        :type => String
  field :waist,                  :type => String
  field :leg,                    :type => String
  field :goal,                   :type => String, :default => "Lose Weight"
  field :trainer,                :type => Boolean, :default => "false"
  field :trainer_moderater,      :type => Boolean, :default => "false"


  ## Relationships
  has_many :workouts

  ## Database authenticatable
  field :email,                  :type => String, :null => false, :default => ""
  field :encrypted_password,     :type => String, :null => false, :default => ""


  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time


  ## Rememberable
  field :remember_created_at,    :type => Time


  ## Trackable
  field :sign_in_count,          :type => Integer, :default => 0
  field :current_sign_in_at,     :type => Time

  field :last_sign_in_at,        :type => Time
  field :current_sign_in_ip,     :type => String
  field :last_sign_in_ip,        :type => String

  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  def self.find_by_nickname(nickname)
    User.where(nickname = "#{nickname}")
  end

  def copy_to_last_weight 
    self.last_weight = weight
  end
    
end

