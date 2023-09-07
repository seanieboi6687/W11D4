# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
  TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
      ].sort.freeze
        
    validates_presence_of :name, :name, :attack, :defense, :poke_type, :image_url
    validates :captured, inclusion: [true, false]
    validates :name, length: {in: 3..255}, uniqueness: {message: "'%{value}' is already in use"}
    validates :number, uniqueness: {message: "'%{value}' is already in use"}
    validates :attack, :defense, numericality: {in: 0..100}
    validates :number, numericality: {greater_than: 0}
    validates :poke_type, inclusion: {in: TYPES, messages: "'%{value}' is not a valid pokemon type"}

      has_many :poke_moves,
        foreign_key: :pokemon_id,
        class_name: :PokeMove,
        dependent: :destroy

      has_many :moves,
        through: :poke_moves,
        source: :move

      has_many :items,
        foreign_key: :pokemon_id,
        class_name: :Item,
        dependent: :destroy

end
