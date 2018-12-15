require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender #BankAccount instance
    @receiver = receiver #BankAccount instance
    @amount = amount #amount sending #integer
    @status = "pending"
  end

  #can check that both accts are valid
  #calls on sender and rcvrs valid? methods
  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  #execute a successful xfer btw accts
  #each xfer can only happen once (makes an instance of an xfer?)
  #rejects xfer if sender =/= valid acct
  def execute_transaction
    if valid? && @sender.balance > amount && @status == "pending"
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    else
      reject
    end
  end

  def reject
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end



  #can reverse xfer btw two accts
  #can only reverse executed xfers
  def reverse_transfer
    if @status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
    end
  end


end
#binding.pry
