# frozen_string_literal: true

module Types
  class UpdateCourseInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :lecturer_name, String, required: false
    argument :description, String, required: false
    argument :chapters, [Types::ChapterInputType], required: false
  end
end
