#encoding: utf-8

module HH
  module API
    module Metro
      def metro
        get("metro")
      end

      def metro_line(line_id)
        get("metro/#{line_id}")
      end

      def metro_station(station_id, line_id)
        get("metro/#{station_id},#{line_id}")
      end
    end
  end
end