# frozen_string_literal: true

module Mutations
  class UpdateCourse < Mutations::BaseMutation
    # 接收參數
    argument :input, Types::UpdateCourseInputType, required: true

    # 回傳結果
    field :course, Types::CourseType, null: true
    field :errors, [String], null: false

    def resolve(input:)
      course = Course.find(input[:id])
      course.update!(name: input[:name], description: input[:description], lecturer_name: input[:lecturer_name])

      if input[:chapters].present?
        input[:chapters]&.each do |chapter_input|
          chapter = course.chapters.find(chapter_input[:id])
          chapter.update!(name: chapter_input[:name])

          if chapter_input[:units].present?
            chapter_input[:units]&.each do |unit_input|
              unit = chapter.units.find(unit_input[:id])
              unit.update!(
                name: unit_input[:name],
                description: unit_input[:description],
                content: unit_input[:content]
              )
            end
          end
        end
      end

      if course.save
        { course: course, errors: [] }
      else
        { course: nil, errors: course.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound => e
      { course: nil, errors: [e.message] }
    end
  end
end
