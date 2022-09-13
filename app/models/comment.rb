class Comment < ApplicationRecord
    belongs_to :blog
    validates :comment, presence: true;
    validates :name, presence: true;
end
