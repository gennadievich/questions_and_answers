class Category < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :questions, dependent: :destroy
  
  def name=(val)
    write_attribute(:name, val.upcase)
  end

  def self.categories_names
    all.map(&:name)
  end
end
