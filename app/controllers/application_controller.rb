require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    blogs = Blog.all
    blogs.to_json #
  end

  post '/blogs' do
    # Create a new blog
    blog = Blog.create(params)
    if blog.valid?
      blog.to_json # Return blog data as JSON
    else
      { error: 'Failed to create blog' }.to_json # Return error message as JSON
    end
  end
  
  get '/blogs' do
    # Get all blogs
    blogs = Blog.all
    blogs.to_json # Return blogs data as JSON
  end
  
  get '/blogs/:id' do
    # Get a specific blog
    blog = Blog.find(params[:id])
    blog.to_json # Return blog data as JSON
  end
  
  patch '/blogs/:id' do
    # Update a blog
    blog = Blog.find(params[:id])
    if blog.update(params)
      blog.to_json # Return updated blog data as JSON
    else
      { error: 'Failed to update blog' }.to_json # Return error message as JSON
    end
  end
  
  delete '/blogs/:id' do
    # Delete a blog
    blog = Blog.find(params[:id])
    if blog.destroy
      { message: 'Blog deleted successfully' }.to_json # Return success message as JSON
    else
      { error: 'Failed to delete blog' }.to_json # Return error message as JSON
    end
  end
end
