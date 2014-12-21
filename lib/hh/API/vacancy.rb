#encoding: utf-8

module HH
  module API
    module Vacancy
      def vacancy(vacancy_id)
        get("vacancy/#{vacancy_id}")
      end
    end
  end #API
end #HH