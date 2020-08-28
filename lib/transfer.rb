class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all=[]

  def self.all
    @@all
  end

  def initialize(sender, receiver, amount)
    @receiver=receiver
    @sender=sender
    @status = "pending"
    @@all<<self
    @amount = amount
  end
  def valid?
    # if BankAccount.all.find{|account| account.name == sender}.valid? && BankAccount.all.find{|account| account.name == receiver}.valid?
    #   true
    # else 
    #   false
    # end
    if sender.valid? && receiver.valid?
      true
    else 
      false
    end
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
