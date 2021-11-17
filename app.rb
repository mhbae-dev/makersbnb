# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space.rb'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:sign_up)
  end

  post '/' do
    User.create(params['email_address'], params['password'])
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
  end

  post '/spaces' do
    Space.add(space_name: params[:name], 
    space_description: params[:description], 
    space_price: params[:price_per_night], 
    available_from: params[:available_from], 
    available_to: params[:available_to])
    
    redirect "/spaces"
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  run! if app_file == $PROGRAM_NAME
end
