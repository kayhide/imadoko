FactoryGirl.define do
  factory :race do
    sequence(:label) {|i| "Race #{i}"}
    sequence(:url) {|i| "http://imadoko.github.com/race/#{i}"}
    crawler nil
    distance Race::Distance::FULL_MARATHON
    starts_at "2013-12-25 9:00:00"
    ends_at "2013-12-25 16:00:00"
  end
end
