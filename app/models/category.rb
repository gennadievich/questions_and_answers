class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :questions, dependent: :destroy
  
  def name=(val)
    write_attribute(:name, val.upcase)
  end
  
  def has_questions?
    questions.present?
  end
end
