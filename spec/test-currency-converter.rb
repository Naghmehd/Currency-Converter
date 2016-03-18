require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency-converter.rb'

class CurrencyConverterTest < MiniTest::Test

  def test_currency_converter_class_exist
    rate = {}
    currency_converter1 = CurrencyConverter.new(rate)
    assert currency_converter1

    assert_equal({}, currency_converter1.rate)
  end

  def test_currency_converter_key_value
    rate = {USA: 1.0, GBP: 2.0, JPY: 1.5}
    currency_converter1 = CurrencyConverter.new(rate)
    assert_equal(rate, currency_converter1.rate)
  end

  def test_currency_converter_convertes
    currency = Currency.new(10.0, :USA)
    code = :GBP
    rate = {USA: 1.0, GBP: 2.0}
    currency_converter1 = CurrencyConverter.new(rate)
    assert(currency_converter1.converter(currency, code))
  end

  def test_currency_converter_three
    test_currency = Currency.new(300, :JPY)
    code = :USD
    rate = {USD: 1.0, GBP: 2.0, JPY:120 }
    currency_converter1 = CurrencyConverter.new(rate)
    yen_to_usd = currency_converter1.converter(test_currency, code)
    assert_equal(2.5, yen_to_usd)
  end

  def test_unknown_currency_converter_error
    test_currency = Currency.new(300, :INR)
    code = :USD
    rate = {USD: 1.0, GBP: 2.0, JPY:120 }
    currency_converter1 = CurrencyConverter.new(rate)
    yen_to_usd = currency_converter1.converter(test_currency, code)
    assert_equal(2.5, yen_to_usd)
    assert_raises UnknownCurrencyCodeError
  end

end
