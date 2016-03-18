require_relative '../lib/currency.rb'

class UnknownCurrencyCodeError < StandardError
  def message
    "Unknown Currency error!!"
  end
end

class CurrencyConverter

  attr_reader :rate

  def initialize(rate)
    @rate  = rate
  end


  def converter(currency, code)
    currency_amount = currency.amount
    currency_code = currency.code
    new_code = code
    currency_rate_1 = @rate.fetch(new_code)
    currency_rate_2 = @rate.fetch(currency_code)
    if @rate.key?(new_code)
    converted_amount = (currency_rate_1 / currency_rate_2 ) * currency_amount
    else
      raise UnknownCurrencyCodeError
    end
  end


end
