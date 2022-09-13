FactoryBot.define do
    factory :user do |f|
        f.name { "1" }
        f.sequence(:email) { |n| "test#{n}@example.com" }
        f.password { "password" }
        f.password_confirmation {|d| d.password }
    end
    
    factory :blog do |f|
        f.sequence(:title) {|n| "Title #{n}" }
        f.author {"1"}
        f.sequence(:content) {|n| "Content #{n}" }
        f.time {Time.zone.now+1.day }
        f.association :user
    end
    
    factory :comment do |f|
       f.sequence(:name) {|n| "Name #{n}" }
       f.sequence(:comment) {|n| "Comment NO. #{n}" }
       f.association :blog
    end
    
end