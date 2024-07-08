# frozen_string_literal: true

module Types
  class ChapterInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :sequence, Integer, required: false
    argument :units, [Types::UnitInputType], required: false
  end
end
