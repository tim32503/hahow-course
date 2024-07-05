# frozen_string_literal: true

module Types
  class CourseInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :lecturer_name, String, required: true
    argument :description, String, required: false
    argument :chapters, [Types::ChapterInputType], required: false
  end
end
