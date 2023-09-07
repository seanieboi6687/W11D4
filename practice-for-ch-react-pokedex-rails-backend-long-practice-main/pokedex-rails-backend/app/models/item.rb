# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  name       :string           not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
    validate_presence_of :pokemon_id, :name, :price, :happiness, :image_url
    validates :name, length: {maxiumum: 254}
    validates :price, numericality: {greater_than_or_equal_to: 0}

    belongs_to :pokemon,
        foreign_key: :pokemon_id,
        class_name: :Pokemon
end
