# frozen_string_literal: true

module Mutations
  class DeleteCourse < BaseMutation
    # 接收參數
    argument :id, ID, required: true

    # 回傳結果
    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      ActiveRecord::Base.transaction do
        course = Course.find(id)

        return { success: true, errors: nil } if course.destroy

        { success: false, errors: course.errors.full_messages }
      rescue ActiveRecord::RecordNotFound => e
        return { success: false, errors: [e.message] }
      rescue ActiveRecord::RecordNotDestroyed => e
        return { success: false, errors: [e.message] }
      end
    end
  end
end
