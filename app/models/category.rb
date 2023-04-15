class Category < ActiveRecord::Base
  has_many :blog_categories
  has_many :blogs, through: :blog_categories
end