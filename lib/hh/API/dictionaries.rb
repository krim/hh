#encoding: utf-8

module HH
  module API
    module Dictionaries
      def dictionaries
        get("dictionaries")
      end
    end
  end #API
end #HH