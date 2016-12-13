def change(cents_received) 
 	#coins = {}

 	# money = {:ten => 1000, :five => 500, :one => 100, :half_dollar => 50, :quarter => 25, :dime => 10, :nickel => 5, :penny => 1}
 	# money.each do |coin_type, coin_value|

 	# 	if cents_in_change >= coin_value
  # 			coins[coin_type] = cents_in_change / coin_value
 	# 		cents_in_change = cents_in_changec % coin_value

 	coins = {penny: 0, nickle: 0, dime: 0, quarter: 0, half_dollar: 0, one: 0, five: 0, ten: 0, twenty: 0}
	coin_value = {twenty: 2000, ten: 1000, five: 500, one: 100, half_dollar: 50, quarter: 25, dime: 10, nickle: 5, penny: 1}
	

	coin_value.each do | coin, value|
      while
      	value <= cents_received
      	coins[coin] += 1
      	cents_received = cents_received - value
 		end
 	end
 	coins
 end

 def coinbank(coins)
	change = ""
	coins.each do |key, value|
		if value > 0
		change << " " + value.to_s + " " + key.to_s+ "(s)"
	    end
		
	end
	change
end