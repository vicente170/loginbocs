class Item < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :price, presence: true
  validates :company, presence: true
  validates :enddate, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
