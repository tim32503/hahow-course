# frozen_string_literal: true

module Types
  class UnitInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :description, String, required: false
    argument :content, String, required: true
  end
end
