class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :published_at, presence: true
  belongs_to :user

  before_validation :set_published_at, on: :create

  def self.published
    where("published_at <= ?", Time.current)
  end

  private

  def set_published_at
    self.published_at ||= Time.current
  end
end
