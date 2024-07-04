# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :chapter

  validates :name, presence: true
  validates :content, presence: true
end
