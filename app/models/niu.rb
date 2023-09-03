class Niu < ApplicationRecord
  belongs_to :nius_user
  has_many :comments
  accepts_nested_attributes_for :comments, reject_if: ->(attributes){ attributes['content'].blank? }, allow_destroy: true

end
