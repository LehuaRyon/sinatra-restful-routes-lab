class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # gets new form
  get '/recipes/new' do
    erb :new
  end


  # gets all recipes from index pg
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # gets recipe by id
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 

  # gets edit form for recipe by id
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # creates new recipe w/user input from form
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end 

  # updates recipe w/user input from edit form
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @coffee.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  # deletes recipe by id
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end 

end
