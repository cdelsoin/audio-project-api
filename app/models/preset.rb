class Preset < ActiveRecord::Base
  belongs_to :user
  # validates :text, :user, presence: true
  # validates :user, presence: true
end
