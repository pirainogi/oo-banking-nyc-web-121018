require 'pry'
class BankAccount

  attr_reader :name
  attr_accessor :balance, :status, :sender, :receiver
  #initialize a Bank Account
  #initialize with a name argument
  #always initializes with a balance of 1000
  #always initializes iwth a status of "open"
  #can't change its name
  def initialize(name)
    @name = name #string
    @balance = 1000 #integer
    @status = "open" #string
  end

  #can deposit money into its acct
  #add deposit amt to current balance?
  def deposit(amount)
    @balance += amount
    @balance
  end

  #return balance
  def display_balance
    "Your balance is $#{@balance}."
  end

  #valid = open status and balance > 0
  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  #can close its account -- clear all?
  def close_account
    @status = "closed"
  end


end
#binding.pry
