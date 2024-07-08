# frozen_string_literal: true

require 'rails_helper'
require 'support/delete_course_helper'

RSpec.describe '刪除課程 API', type: :request do
  include DeleteCourseHelper

  describe '#resolve' do
    let!(:course) { create(:course) }
    let!(:chapter) { create(:chapter, course: course) }
    let!(:unit) { create(:unit, chapter: chapter)}

    it '刪除課程成功，且章節及單元皆同時被刪除' do
      expect {
        post '/graphql', params: { query: delete_course_mutation(course.id) }
      }.to change { Course.count }.by(-1)
       .and change { Chapter.count }.by(-1)
       .and change { Unit.count }.by(-1)

      json = JSON.parse(response.body)
      data = json['data']['deleteCourse']

      expect(data['success']).to be true
      expect(data['errors']).to be_nil
    end

    it '因找不到該課程，刪除課程失敗' do
      post '/graphql', params: { query: delete_course_mutation(0) }

      json = JSON.parse(response.body)
      data = json['data']['deleteCourse']

      expect(data['success']).to be false
      expect(data['errors']).to be_present
      expect(data['errors']).to eq(["Couldn't find Course with 'id'=0"])
    end
  end
end
