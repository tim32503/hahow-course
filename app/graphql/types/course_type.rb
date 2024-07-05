# frozen_string_literal: true

module Types
  class CourseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :lecturer_name, String, null: false
    field :description, String, null: true
    field :chapters, [Types::ChapterType], null: true

    def chapters
      object.chapters
    end
  end
end
