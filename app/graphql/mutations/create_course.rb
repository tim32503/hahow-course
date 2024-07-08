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
        course = Course.new(
          name: input[:name],
          lecturer_name: input[:lecturer_name],
          description: input[:description]
        )

        # 若課程建立失敗，回傳錯誤訊息
        course.save!

        input[:chapters]&.each do |chapter_input|
          chapter = course.chapters.create!(
            name: chapter_input[:name]
          )

          chapter_input[:units]&.each do |unit_input|
            chapter.units.create!(
              name: unit_input[:name],
              description: unit_input[:description],
              content: unit_input[:content]
            )
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
