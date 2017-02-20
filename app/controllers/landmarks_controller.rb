class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch "/landmarks/:id" do 
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    # figure.titles << Title.create(params[:title]) if !params[:title][:name].empty?
    # figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty?
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    landmark.figure = Figure.create(params[:figure]) if !params[:figure][:name].empty?
  end

  
end
