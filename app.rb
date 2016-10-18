require 'sinatra'
require_relative 'coinbank.rb'

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
	redirect '/numbers?user_name=' + name + '&user_age=' + age
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

	redirect '/amount?user_name=' + name + '&user_age=' + age + '&num1=' + number1 + '&num2=' + number2 + '&num3=' + number3 
end

#something breaks this at line 37. TypeError at numbers/ no implicit conversion of nil into string

get '/amount' do
	age = params[:user_age]
	name = params[:user_name]
	number1 = params[:num1].to_i
	number2 = params[:num2].to_i	
	number3 = params[:num3].to_i
	total = number1 + number2 + number3
	
	erb :get_amount, :locals => {:name => name, :age => age, :number1 => number1, :number2 => number2, :number3 => number3, :total => total}
end

post '/amount' do
	name = params[:user_name]
	user_money = params[:money_tendered].to_i
	coins = change(user_money)
	results = coinbank(coins)

	erb :results, :locals => {:name => name, :user_money => user_money, :results => results }
end
	
get '/Contact' do
	erb :contact
end

get '/About' do
	erb :about
end

get '/History' do
	erb :history
end
