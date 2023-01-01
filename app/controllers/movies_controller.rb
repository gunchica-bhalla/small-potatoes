class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end

  def create
      @movie = Movie.new
      @movie.title = params[:title].to_s
      @movie.rating = params[:rating].to_s
      @movie.release_date = params[:release_date].to_s
      @movie.description= params[:description].to_s
      success=@movie.save
      if success
          #redirect_to movies_path(@movie)
          render "show"
      end
  end

  def new    
  end

  def edit
  end

  def show
       id =params[:id].to_s
       #m=Movie.find id

       if id.to_i.to_s!=id || id.to_i == 0 #check if the id is an integer
           flash[:message] = "Unable to show movie. Invalid id."
           redirect_to movies_path
       elsif id.to_i.to_s == id
           begin
               @movie=Movie.find id 
           rescue ActiveRecord::RecordNotFound
               flash[:message] = "Unable to show movie. Id does not exist."
               redirect_to movies_path
           else
               @movie = Movie.find id   
           end
       end
       #elsif #m == nil
           

       #end
    
  end

  def update
  end

  def destroy
  end
end
