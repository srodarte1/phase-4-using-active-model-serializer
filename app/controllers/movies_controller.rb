class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
  #  byebug
    if request.url == "http://localhost:3000/movies/#{params[:id]}"

    render json: movie, status: 200
    else 
      render json: movie, serializer: MovieSummarySerializerSerializer, status: 200
    end
  end
  # def summary
  #   movie = Movie.find(params[:id])
  #   render json: movie, serializer: MovieSummarySerializerSerializer, status: 200
  # end
  def summaries 
    movies = Movie.all
    render json: movies, each_serializer: MovieSummarySerializerSerializer, status: 200
  end


  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
