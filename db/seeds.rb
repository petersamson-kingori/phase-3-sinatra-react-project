puts "🌱 Seeding spices..."

# Seed your database here
art_category = Category.find_by(name: 'Art')

if art_category
  blogs = Blog.where(category_id: nil) # Fetch blogs with null category_id
  blogs.each do |blog|
    blog.categories << art_category # Add art_category to blog's categories
  end
end

design_category = Category.find_by(name: 'Design')

if design_category
  blogs = Blog.where(category_id: nil) # Fetch blogs with null category_id
  blogs.each do |blog|
    blog.categories << design_category # Add design_category to blog's categories
  end
end

technology_category = Category.find_by(name: 'Technology')

if technology_category
  blogs = Blog.where(category_id: nil) # Fetch blogs with null category_id
  blogs.each do |blog|
    blog.categories << technology_category # Add technology_category to blog's categories
  end
end
puts "✅ Done seeding!"