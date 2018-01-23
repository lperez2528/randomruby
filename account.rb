p "Whats your name?"
name = gets.chomp
p "Your account number is #{num = 5.times.map{rand(10)}.join}"
p "What 4 number pin would you like to set?"
pi = gets.chomp.to_i
p "How much would to like to deposit?"
am = gets.chomp.to_i


class Account
	attr_accessor :name
	attr_accessor :acc_number
	attr_accessor :balance
	attr_accessor :transactions
	def initialize(name, acc_number, pin, balance = 0)
		@name = name
		@acc_number = acc_number
		@pin = pin
		@balance = balance
		@transactions = {}
	end

	def show_balance(acc_number, pin)
		if @acc_number == acc_number && @pin == pin
			"Your balance is #{@balance}"
		else
			error
		end
		# @acc_number == acc_number && @pin == pin ? "Your balance is #{@balance}" : error
	end

	def withdraw(acc_number, pin, amount)
		if @acc_number == acc_number && @pin == pin
			@transactions[:withdraw] = amount
			"You have withdrawn #{amount}. New balance is #{@balance -= amount}"
		else
			error
		end
		#@acc_number == acc_number && @pin == pin ? "You have withdrawn #{amount}. New balance is #{@balance -= amount}" : error

	end

	def deposit(acc_number, pin, amount)
		if @acc_number == acc_number && @pin == pin
			@transactions[:deposit] = amount
			"You have deposited #{amount}. New balance is #{@balance += amount}"
		else 
			error
		end
		#@acc_number == acc_number && @pin == pin ? "You have deposited #{amount}. New balance is #{@balance += amount}" : error
	end

	def transactions
		@transactions.each do |t,a|
			"A #{t} was performing in the amount of #{a}"
		end
	end

	def error
		"Sorry account / pin number is incorrect"
	end
end

# bank = Account.new("Luis", 123, 456, 10_000)
# bank.withdraw(123, 456, 200)
# bank.deposit(123,456, 200)
# puts bank.transactions
sophia = Account.new(name, num, pi, am)
p sophia.name
p sophia.acc_number

p sophia.deposit(num, pi, 100)
p sophia.withdraw(num, pi, 200)
p sophia.transactions



