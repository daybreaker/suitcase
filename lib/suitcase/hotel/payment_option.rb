module Suitcase
  class PaymentOption
   attr_accessor :code, :name
   extend Suitcase::Helpers

    def initialize(code, name)
      @code = code
      @name = name
    end

    def self.find(info)
      currency_code = info[:currency_code]
      types_raw = parse_response(url(:method => "paymentInfo", :params => { "currencyCode" => currency_code }, :session => info[:session]))
      options = []
      types_raw["HotelPaymentResponse"].each do |raw|
        types = raw[0] != "PaymentType" ? [] : raw[1]
        types.each do |type|
          options.push PaymentOption.new(type["code"], type["name"])
        end
      end
      update_session(types_raw, info[:session])
      options
    end
  end
end
