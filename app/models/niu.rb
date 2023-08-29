class Niu < ApplicationRecord
  belongs_to :nius_user
  accepts_nested_attributes_for :nius_user, reject_if: ->(attributes){ attributes['content'].blank? }, allow_destroy: true

end
