#encoding: utf-8

module HH
  module API
    module EmployerVacancies
      def employer_vacancies(employer_id)
        get("employers/#{employer_id}/vacancies")
      end
    end
  end
end