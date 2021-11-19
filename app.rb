# frozen_string_literal: true

require 'sinatra/flash'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'
require './lib/user'

class MakersBnb < Sinatra::Base
  configure :development, :test do
    enable :sessions
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    erb(:sign_up)
  end

  post '/' do
    user = User.create(params['email_address'], params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    user = User.check(params['email_address'], params['password'])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      # Rackup works. rspec cant run flash. All feature tests failing.
      flash[:notice] = 'Please check your email or password.'
      redirect '/login'
    end
  end

  get '/spaces' do
    @user = User.find(session[:user_id])
    if session[:spaces]
      @spaces = session[:spaces]
    else
      @spaces = Space.all
    end

    erb(:spaces)
  end

  post '/spaces' do
    Space.add(
      space_name: params[:name],
      space_description: params[:description],
      space_price: params[:price_per_night],
      available_from: params[:available_from],
      available_to: params[:available_to],
    )

    redirect '/spaces'
  end

  post '/filter' do
    if params[:available_from] && params[:available_to]
      session[:spaces] =
        Space.filter(
          available_from: params[:available_from],
          available_to: params[:available_to],
        )
    end

    redirect '/spaces'
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  run! if app_file == $PROGRAM_NAME
end
