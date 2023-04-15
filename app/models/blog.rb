class Blog < ActiveRecord::Base
  has_many :blogs_categories
  has_many :categories, through: :blogs_categories
end
