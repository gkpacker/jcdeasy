MoneyRails.configure do |config|
  config.default_currency = :brl
  config.default_format = {
    thousands_separator: '.',
    decimal_mark: ','
  }
end
