# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :course

  has_many :units, dependent: :destroy

  validates :name, presence: true

  default_scope { order(sequence: :asc) }
end
