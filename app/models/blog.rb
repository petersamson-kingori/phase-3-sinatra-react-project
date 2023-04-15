class Blog < ActiveRecord::Base
  has_many :blog_categories
  has_many :categories, through: :blog_categories
end
