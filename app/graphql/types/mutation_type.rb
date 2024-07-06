# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # 建立課程
    field :create_course, mutation: Mutations::CreateCourse

    # 編輯課程
    field :update_course, mutation: Mutations::UpdateCourse

    # 刪除課程
    field :delete_course, mutation: Mutations::DeleteCourse
  end
end
