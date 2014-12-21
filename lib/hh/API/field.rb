#encoding: utf-8

module HH
  module API
    module Field
      def fields
        get("field/all")
      end

      def field(field_id)
        get("field/#{field_id}")
      end
    end
  end
end