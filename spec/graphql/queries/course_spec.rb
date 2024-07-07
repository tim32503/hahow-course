# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '查詢特定課程資訊 API', type: :request do
  let!(:course) { create(:course) }
  let!(:chapter) { create(:chapter, course: course) }
  let!(:unit) { create(:unit, chapter: chapter) }

  describe '#resolve' do
    it '回傳特定課程資訊' do
      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']['course']

      # 組裝預期資料
      output_course = course.as_json
      output_course.delete('created_at')
      output_course.delete('updated_at')
      output_course.transform_keys! { |key| key.camelize(:lower) }
      output_course.transform_values!(&:to_s)

      output_chapter = chapter.as_json
      output_chapter.delete('created_at')
      output_chapter.delete('updated_at')
      output_chapter.delete('course_id')
      output_chapter.transform_keys! { |key| key.camelize(:lower) }
      output_chapter.transform_values!(&:to_s)

      output_unit = unit.as_json
      output_unit.delete('created_at')
      output_unit.delete('updated_at')
      output_unit.delete('chapter_id')
      output_unit.transform_keys! { |key| key.camelize(:lower) }
      output_unit.transform_values!(&:to_s)

      output_chapter.merge!('units' => [output_unit])
      output_course.merge!('chapters' => [output_chapter])

      expect(data).to eq(output_course)
    end
  end

  def query
    <<~GRAPHQL
      {
        course(id: #{course.id}) {
          id
          name
          lecturerName
          description
          chapters {
            id
            name
            units {
              id
              name
              description
              content
            }
          }
        }
      }
    GRAPHQL
  end
end
