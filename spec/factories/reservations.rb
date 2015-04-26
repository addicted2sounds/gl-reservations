FactoryGirl.define do
  factory :reservation do
    table
    start_time { Faker::Time.forward(5) }
    end_time { start_time + rand(24).hours }
  end
end
