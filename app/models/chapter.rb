# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :course

  has_many :units

  validates :name, presence: true
end
