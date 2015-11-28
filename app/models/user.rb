class User < ActiveRecord::Base
  STATUS = ["Newbie", "User", "Trusted", "VIP"]
  ROLE   = ["user", "admin"]
  
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  has_many :questions
  has_many :answers
  
  def admin?
    self.role == "admin"
  end
end
