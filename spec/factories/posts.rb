FactoryBot.define do
  factory :post do
    title                  {"テキスト"}
    association :user             
    
  end
end