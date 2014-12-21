#encoding: utf-8

module HH
  module API
    module VacancyEmployer
      def vavancy_employer(employer_id)
        get("vacancy/employer/#{employer_id}")
      end
    end
  end
end