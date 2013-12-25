FactoryGirl.define do
  factory :entry do
    race nil
    sequence(:number) {|i| "123#{i}"}
    status nil

    trait :with_race do
      race
    end
  end
end
