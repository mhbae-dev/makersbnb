# frozen_string_literal: true

require 'pg'
require_relative './web_helper.rb'

class Space
  # comment

  # attr_reader :name, :description, :price

  # def initialize(name, description, price)
  #   @name = name
  #   @description = description
  #   @price = price
  # end

  def self.all
    conn = set_environment

    result = conn.exec('SELECT * FROM spaces;')

    result.map do |space|
      [space['name'], space['description'], space['price'], space['available_from'], space['available_to']]
    end
  end

  def self.add(space_name:, space_description:, space_price:, available_from:, available_to:)
    conn = set_environment
    conn.exec("INSERT INTO spaces (name, description, price, available_from, available_to) VALUES('#{space_name}','#{space_description}','#{space_price}','#{available_from}','#{available_to}');")
  end
end
