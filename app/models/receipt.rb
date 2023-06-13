class Receipt < ApplicationRecord
  belongs_to :user

  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def delete!
    update(deleted_at: Time.now)
  end
end
