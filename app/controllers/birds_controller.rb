class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create #hash below with key/ value pairs.. could also write like ......bird = Bird.create({name: params[:name], species: params[:species]})
    #byebug
    bird = Bird.create(name: params[:name], species: params[:species]) #mass assignment allows u to set many attributes key value pairs ..instead do> bird = Bird.create(params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

end
