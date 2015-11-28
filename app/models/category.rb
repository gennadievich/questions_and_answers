class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :questions, dependent: :destroy
  
  def name=(val)
    write_attribute(:name, val.upcase)
  end

  def self.categories_names
    all.map(&:name)
  end
  
  def has_questions?
    questions.present?
  end
end
