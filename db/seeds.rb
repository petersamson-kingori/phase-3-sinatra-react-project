puts "🌱 Seeding spices..."

art_category = Category.find_or_create_by(name: 'Art')
design_category = Category.find_or_create_by(name: 'Design')
technology_category = Category.find_or_create_by(name: 'Technology')

# Create sample blogs
blog1 = Blog.create(title: 'Sample Blog 1', content: 'This is a sample blog about art.')
blog2 = Blog.create(title: 'Sample Blog 2', content: 'This is a sample blog about design.')
blog3 = Blog.create(title: 'Sample Blog 3', content: 'This is a sample blog about technology.')

# Assign categories to sample blogs using categorizations
Categorization.create(blog: blog1, category: art_category)
Categorization.create(blog: blog2, category: design_category)
Categorization.create(blog: blog3, category: technology_category)

puts "✅ Done seeding!"