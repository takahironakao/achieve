class Blog < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
    default_scope -> { order(created_at: :desc) }
    
    belongs_to :user
end
