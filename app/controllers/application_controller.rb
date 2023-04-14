class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    blogs = Blog.all
    blogs.to_json
  end

   # Retrieve all blogs in JSON format
   get "/blogs" do
    blogs = Blog.all
    blogs.to_json
  end


# GET /blogs/art
get "/blogs/art" do
  category = Category.find_by(name: 'Art') 
  if category
    blogs = category.blogs 
    blogs.to_json 
  else
    { error: 'Category not found' }.to_json 
  end
end

# GET /blogs/design
get "/blogs/design" do
  category = Category.find_by(name: 'Design') 
  if category
    blogs = category.blogs 
    blogs.to_json 
  else
    { error: 'Category not found' }.to_json 
  end
end

# GET /blogs/technology
get "/blogs/technology" do
  category = Category.find_by(name: 'Technology')
  if category
    blogs = category.blogs 
    blogs.to_json 
  else
    { error: 'Category not found' }.to_json 
  end
end

end


# POST /blogs
post "/blogs" do
  # Retrieve parameters from request body
  title = params[:title]
  content = params[:content]
  category_id = params[:category_id]

  # Create a new blog with the retrieved parameters
  blog = Blog.create(title: title, content: content, category_id: category_id)

  if blog.save
    # Retrieve all blogs and add the newly created blog at the top
    blogs = Blog.all
    blogs.unshift(blog)

    { message: "Blog created successfully", blog: blog, blogs: blogs }.to_json
  else
    { error: "Failed to create blog", errors: blog.errors }.to_json
  end
end


# PUT /blogs/:id
put "/blogs/:id" do
  # Retrieve parameters from request body
  title = params[:title]
  content = params[:content]
  category_id = params[:category_id]

  # Find the blog by ID
  blog = Blog.find_by(id: params[:id])

  if blog
    # Update the blog with the retrieved parameters
    blog.update(title: title, content: content, category_id: category_id)
    { message: "Blog updated successfully", blog: blog }.to_json
  else
    { error: "Blog not found" }.to_json
  end
end

# DELETE /blogs/:id
delete "/blogs/:id" do
  # Find the blog by ID
  blog = Blog.find_by(id: params[:id])

  if blog
    # Delete the blog
    blog.destroy
    { message: "Blog deleted successfully" }.to_json
  else
    { error: "Blog not found" }.to_json
  end
end

get "/blogs/new" do
  blogs = Blog.order(created_at: :desc).limit(10)
  blogs.to_json 
end