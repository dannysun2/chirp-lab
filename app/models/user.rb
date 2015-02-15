class User < ActiveRecord::Base
   acts_as_followable
   acts_as_follower
   has_secure_password validations: false
   has_many :chirps

   mount_uploader :avatar, AvatarUploader

   def full_name
    [first_name, last_name].join(" ")
  end

  # login step
  validates :username, presence: true, uniqueness: true, :if => :active_or_login?
  validates :password, confirmation: true, :if => :active_or_login?
  # personal step
  validates :firstname, presence: true, :if => :active_or_personal?
  validates :lastname, presence: true, :if => :active_or_personal?
  validates :email, presence: true, :if => :active_or_personal?
  # avatar step
  validates :avatar, presence: true, :if => :active_or_profile?

  def active?
    status == 'active'
  end

  def active_or_login?
    status.include?('login') || active?
  end

  def active_or_personal?
    status.include?('personal') || active?
  end

  def active_or_profile?
    status.include?('profile') || active?
  end

end
