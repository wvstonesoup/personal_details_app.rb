require_relative 'add_func.rb'
require 'sinatra'

get '/' do 
	erb :get_name
end

post '/name' do
	name = params[:user_name]
	redirect '/age?users_name=' + name
end	

get '/age' do
	name = params[:users_name]
	erb :get_age, :locals => {:name => name}
end

post '/age' do
	age = params[:user_age]
	name = params[:user_name]
	redirect '/numbers?user_name=' + name + "&user_age=" + age
end

get '/numbers' do
	age = params[:user_age]
	name = params[:user_name]
	erb :get_3_fav_num, :locals => {:name => name, :age => age}
end

post '/numbers' do
	age = params[:user_age]
	name = params[:user_name]
	number1 = params[:num1]
	number2 = params[:num2]
	number3 = params[:num3]
	sum = add(number1.to_i, number2.to_i, number3.to_i)

"Here's what I know so far.  Your name is #{name}, you are #{age} years old, and your favorite numbers are #{number1}, #{number2}, and #{number3}, which totals #{sum} when added together. Do you want to tell me more?"
end
