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
      blog.to_json 
    else
      { error: 'Failed to create blog' }.to_json 
    end
  end
  
  get '/blogs' do
    # Get all blogs
    blogs = Blog.all
    blogs.to_json 
  end
  
  get '/blogs/:id' do
    # Get a specific blog
    blog = Blog.find(params[:id])
    blog.to_json 
  end
  
  patch '/blogs/:id' do
    # Update a blog
    blog = Blog.find(params[:id])
    if blog.update(params)
      blog.to_json 
    else
      { error: 'Failed to update blog' }.to_json 
    end
  end
  
  delete '/blogs/:id' do
    # Delete a blog
    blog = Blog.find(params[:id])
    if blog.destroy
      content_type :json 
      { message: 'Blog deleted successfully' }.to_json 
    else
      content_type :json 
      { error: 'Failed to delete blog' }.to_json 
    end
  end
end
