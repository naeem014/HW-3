# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @all_ratings = Movie.first.rate
    rate_spec = params[:ratings]
    rate_options = Array.new()
    if rate_spec != nil
      rate_spec.each_key{|k| rate_options << k}
      @movies.select!{|m| rate_options.include?(m.rating)}
    end     
    id = params[:sort_by]
    if id === "title"
        @movies.sort_by!{|m| [m.title]}
        @title_class = "hilite"
    elsif id === "date"
	@movies.sort_by!{|m| [m.release_date]}
        @date_class = "hilite"	
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # Look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
   @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
