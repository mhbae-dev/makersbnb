# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space.rb'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @spaces = Space.all
    p @spaces
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME
end
