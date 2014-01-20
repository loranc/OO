
# This is how you define your own custom exception classes
require_relative "Transactions" #relativ path to access the Transaction file. 

class DepositError < StandardError
end

class BankAccount

  attr_reader :name, :position, :crypted_iban

  
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  
  MIN_DEPOSIT =  100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban    

    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    puts "vous venez de tirer #{amount}"
    add_transaction(-amount)
  end
  
  def deposit(amount)
    puts "vous venez de deposer #{amount}"
    add_transaction(amount)
  end
  
  def transactions_history(args = {})
    # Should print transactions, BUT NOT return the transaction array !
    if args.empty?
      puts "no password given"
      return nil
    if args[password] == @password
      puts @transactions
      return @transactions.dup #(dup for duplicate the transaction without alteration
    else
      puts "wrong password"
      return nil #return something different from the puts to use it in other parts of the code)
    end  

  def iban
    #partial getter (shoulde hide the middle of the iban). .dup allows to duplicate the iban
    @iban[0..3]+"*****"+@iban[(@iban.length-4)..(@iban.length-1)] 
  end

  
  def to_s
    # here we overwrite the to_s object defined in the 'mother class' to string, which usually print the object name and place when called by Puts. 
    # So if we use puts, it will use the to_s method defined in the class method.
    "Owner : #{name}  n\IBAN = #{iban} \n Position: #{@position}"
  end
          
  private  

  
  def add_transaction(amount)
    # Main account logic
    @position = @position + amount
    # Should add the amount in the transactions array
    @transactions << Transactions.new(account) #On rappel la classe transaction pour pouvoir avoir plus de souplesse sur les donnees de transaction. 

    
    # Should update the current position


  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.crypted_iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
# too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")



