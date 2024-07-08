# frozen_string_literal: true

require 'rails_helper'
require 'support/update_course_helper'

RSpec.describe '更新課程 API', type: :request do
  include UpdateCourseHelper

  let!(:course) { create(:course) }
  let!(:chapter) { create(:chapter, course: course) }
  let!(:unit) { create(:unit, chapter: chapter) }

  describe '#resolve' do
    it '課程更新成功' do
      post '/graphql', params: { query: good_mutation(course.id) }

      json = JSON.parse(response.body)

      expect(json['data']).to be_present
      expect(json['errors']).to be_nil
    end

    it '因 Validator 驗證參數失敗（空白課程標題），更新課程失敗' do
      post '/graphql', params: { query: blank_name_mutation(course.id) }

      json = JSON.parse(response.body)
      data = json['data']['updateCourse']

      expect(data['errors']).to be_present
      expect(data['errors']).to eq(["Validation failed: Name can't be blank"])
    end

    it '章節和單元的順序都可以被調整' do
      chapter2 = create(:chapter, sequence: 2, course: course)

      expect {
        post '/graphql', params: {
          query: change_sequence_mutation(course_id: course.id, chapter_id: chapter2.id, new_chapter_sequence: 5)
        }
      }.to change { chapter2.reload.sequence }.from(2).to(5)
    end
  end
end
