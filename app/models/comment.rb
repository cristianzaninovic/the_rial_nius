class Comment < ApplicationRecord
  belongs_to :nius_user
  belongs_to :niu
end
