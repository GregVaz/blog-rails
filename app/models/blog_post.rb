class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> {  order(published_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at.present? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end

  def human_status
    if draft?
      "Draft"
    elsif published?
      "Published"
    elsif scheduled?
      "Scheduled"
    end
  end
end

# Status string field
# - draft
# - published
# - scheduled

# How to post something with a scheduled date?
# we can use a published_at field
#   published_at:datetime field
#   - nil -> now
#   - datetime -> future - 1.year.ago - 1.year.from_now