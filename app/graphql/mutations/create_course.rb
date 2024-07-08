# frozen_string_literal: true

module Mutations
  class CreateCourse < BaseMutation
    # 接收參數
    argument :input, Types::CourseInputType, required: true

    # 回傳結果
    field :course, Types::CourseType, null: true
    field :errors, [String], null: true

    def resolve(input:)
      ActiveRecord::Base.transaction do
        course = Course.create!(input.to_h.except(:chapters))

        input[:chapters]&.each do |chapter_input|
          chapter = course.chapters.create!(chapter_input.to_h.except(:units))

          chapter_input[:units]&.each do |unit_input|
            chapter.units.create!(unit_input.to_h)
          end
        end

        { course: course }
      rescue StandardError => e
        # 當發生異常時，回傳錯誤訊息
        { course: nil, errors: [e.message] }
      end
    end
  end
end
