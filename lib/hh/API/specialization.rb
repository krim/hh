#encoding: utf-8

module HH
  module API
    module Specialization
      def specializations
        get("specialization/all")
      end

      def specialization(specialization_id)
        get("specialization/#{specialization_id}")
      end
    end
  end
end