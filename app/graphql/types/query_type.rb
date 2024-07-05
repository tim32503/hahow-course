# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # 查詢所有課程
    field :courses, [Types::CourseType], null: false

    # 查詢特定課程
    field :course, Types::CourseType, null: false do
      argument :id, ID, required: true
    end

    def courses
      Course.all
    end

    def course(id:)
      Course.find(id)
    end
  end
end
