class Category < ActiveRecord::Base
  has_many :blogs_categories
  has_many :blogs, through: :blogs_categories
end