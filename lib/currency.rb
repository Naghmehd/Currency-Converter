
  class DifferenceCurrencyCode < StandardError
    def message
      "Different currency error!!"
    end
  end

class Currency
  attr_reader :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code   = code
  end

  def == (other)
    self.amount == other.amount && self.code == other.code
  end

  def +(other)
    if self.code == other.code
      Currency.new(self.amount + other.amount, self.code)
    else
      raise DifferenceCurrencyCode
    end
  end

  def -(other)
    if self.code == other.code
      Currency.new(self.amount - other.amount, self.code)
    else
      raise DifferenceCurrencyCode
    end
  end

    def *(number)
      rounded_amount = self.amount * number
      Currency.new(rounded_amount.round(2), self.code)
    end
 

end
