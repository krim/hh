#encoding: utf-8

module HH
  module API
    module Vacancy
      def vacancy(vacancy_id)
        get("vacancies/#{vacancy_id}")
      end

      def vacancies(params = {})
        get("vacancies", params)
      end
    end
  end #API
end #HH