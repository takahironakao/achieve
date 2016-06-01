class Contact < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :content, presence: true
    default_scope -> { order(created_at: :desc) }
end
