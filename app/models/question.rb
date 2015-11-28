class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :category_id, presence: true
  
  has_many :answers, dependent: :destroy
  
  belongs_to :user
  belongs_to :category
  
  def answered_by(user)
    find_answer_by(user).present?
  end
  
  def find_answer_by(user)
    answers.where("user_id = ?", user.id)
  end
end
