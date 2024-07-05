# frozen_string_literal: true

module Types
  class ChapterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :units, [Types::UnitType], null: false
  end

  def units
    object.units
  end
end
