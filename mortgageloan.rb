def prompt(message)
	Kernel.puts("=> #{message}")
end

loop do
	prompt("Welcome to Mortgage Calculator")
	prompt("Please enter your name")

	name = ''
	loop do
		name = Kernel.gets().chomp()

		if name.empty?()
			prompt("make sure you enter valid name!")
		else
			break
		end
	end

	prompt ("Hi #{name}!")

	prompt("What is the loan amount?")

	amount = ''
	loop do 
		amount = Kernel.gets().chomp()

		if amount.empty?()
			prompt("make sure you enter valid amount!")
		else
			break
		end
	end

	prompt ("What is the interest rate?")
	prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

	interest_rate = ''
	loop do 
		interest_rate = Kernel.gets().chomp()

		if interest_rate.empty?() || interest_rate.to_f() < 0
			prompt("Must enter positive number!")
		else
			break
		end
	end

	prompt("What is the loan duration (in years)?")

	years = ''
	loop do 
		years = Kernel.gets().chomp()

		if years.empty?() || years.to_i() < 0
			prompt("Enter valid number!")
		else
			break
		end
	end

	annual_interest_rate = interest_rate.to_f() / 100
	monthly_interest_rate = annual_interest_rate / 12
	months = years.to_i() * 12

	monthly_payment = amount.to_f() * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months.to_i()))

	prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

	prompt("Do you want another calculation?")
	answer = Kernel.gets().chomp()

	break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator")
prompt("Good bye!")