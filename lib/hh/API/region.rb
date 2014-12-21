#encoding: utf-8

module HH
  module API
    module Region
      def regions
        get("areas")
      end

      def region(area_id)
        get("areas/#{area_id}")
      end
    end
  end #API
end #HH