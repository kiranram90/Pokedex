class PokemonsController < ApplicationController
  before_action :redirect_if_not_logged_in


  def new
    @pokemon = Pokemon.new
  end

  def index
   @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find_by_id(params[:id])
    redirect_to pokemons_path if !@pokemon
  end


    def create
      @pokemon = current_user.pokemons.build(pokemon_params)
      if @pokemon.save
        redirect_to pokemons_path
      else
        render :new
      end
    end


    private

    def pokemon_params
       params.require(:pokemon).permit(:title,:category)
    end

     
end


