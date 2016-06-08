class Contact < ActiveRecord::Base
    validates :name, presence: true
    validates :content, presence: true
    default_scope -> { order(created_at: :desc) }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
