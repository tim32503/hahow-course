# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '查詢課程列表 API', type: :request do
  describe '#resolve' do
    it '回傳所有課程資訊' do
      courses = create_list(:course, 3)
      courses.each do |course|
        create_list(:chapter, 3, course: course).each do |chapter|
          create(:unit, chapter: chapter)
        end
      end

      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']['courses']

      expect(data.size).to eq(courses.size)
      expect(data).to all(include('id', 'name', 'chapters'))
    end
  end

  def query
    <<~GRAPHQL
      {
        courses {
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
