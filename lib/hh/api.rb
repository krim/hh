#encoding: utf-8

module HH
  module API

    API_URL = "https://api.hh.ru/"

    include VacancyEmployer
    include Specialization
    include Employment
    include Statistic
    include Currency
    include Employer
    include Schedule
    include Vacancy
    include Region
    include Field
    include Metro
  end #API
end #HH
