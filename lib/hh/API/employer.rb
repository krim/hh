#encoding: utf-8

module HH
  module API
    module Employer
      def employer
        get("employer")
      end

      def employers(params = { per_page: 100, page: 1 })
        get("employers", params)
      end

      # you need right user role to access to employer addresses
      def employer_addresses(employer_id)
        get("/employers/#{employer_id}/addresses")
      end
    end
  end #API
end #HH