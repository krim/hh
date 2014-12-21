#encoding: utf-8

module HH
  module API
    module Region
      def regions
        get("region/all")
      end

      def region(region_id)
        get("region/#{region_id}")
      end
    end
  end #API
end #HH