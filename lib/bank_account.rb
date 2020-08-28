class BankAccount
    
    attr_reader :name
    attr_accessor :balance, :status
    
    @@all =[]

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @balance = 1000
        @status= "open"
        @@all<<self
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end

    def transfers
        Transfer.all.filter {|transfer| transfer.sender || transfer.receiver == self}
    end

end
