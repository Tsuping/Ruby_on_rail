class Blog < ApplicationRecord
    has_many_attached :images
    has_many :comments
    belongs_to :user , foreign_key: 'user_number'
    
    validates :title, presence: true;
    validates :content, presence: true;
    validates :author, presence: true;
    
    
    def self.search(params)
       blogs = Blog.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
       blogs
    end
end
