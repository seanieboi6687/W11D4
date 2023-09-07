class Api::PokemonController < ApplicationController

    def types
        @types = Pokemon.all.select("poke_type").group("poke_type")
        @types_arr = @types.map do |type|
            type['poke_type']
        end

        render json: @types_arr
    end

    def index
        @pokemons = Pokemon.all
        render json: @pokemons
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon        
    end

end
