#encoding: utf-8

module HH
  module API
    module Currency
      def currency
        get("currency")
      end
    end
  end #API
end #HH