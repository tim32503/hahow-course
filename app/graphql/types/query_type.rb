# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :courses, [Types::CourseType], null: false

    def courses
      Course.all
    end
  end
end
