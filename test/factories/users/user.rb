FactoryGirl.define do
  factory :user, class: User do
    email 'test@test.com'
    password 'testerino'
    password_confirmation 'testerino'
  end

  factory :admin, class: User do
    email 'test@test.com'
    password 'testerino'
    password_confirmation 'testerino'
    admin true
  end
end
