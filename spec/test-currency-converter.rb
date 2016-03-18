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

  # def test_currency_converter_method_works
  #   rate = {USA: 1.0, GBP: 20.0}
  #   currency_converter1 = CurrencyConverter.new(rate)
  #   assert(currency_converter1.converter(USA: 1.0, GBP))
  # end

  def test_currency_converter_convertes
    currency = Currency.new(10.0, :USA)
    code = :GBP
    rate = {USA: 10.0, GBP: 20.0}
    currency_converter1 = CurrencyConverter.new(rate)
    assert(currency_converter1.converter(currency, code))
  end

  def test_currency_converter_three
  end

end
