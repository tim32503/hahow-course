# frozen_string_literal: true

module Mutations
  class UpdateCourse < Mutations::BaseMutation
    # 接收參數
    argument :input, Types::UpdateCourseInputType, required: true

    # 回傳結果
    field :course, Types::CourseType, null: true
    field :errors, [String], null: true

    def resolve(input:)
      course = Course.find(input[:id])
      course.update!(input.to_h)

      if input[:chapters].present?
        input[:chapters]&.each do |chapter_input|
          chapter = course.chapters.find(chapter_input[:id])
          chapter.update!(chapter_input.to_h)

          if chapter_input[:units].present?
            chapter_input[:units]&.each do |unit_input|
              unit = chapter.units.find(unit_input[:id])
              unit.update!(unit_input.to_h)
            end
          end
        end
      end

      course.save!

      { course: course, errors: nil }
    rescue StandardError => e
      { course: nil, errors: [e.message] }
    end
  end
end
