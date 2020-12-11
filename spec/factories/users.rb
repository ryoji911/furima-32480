FactoryBot.define do
  factory :user do
    nickname { 'ryoji' }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birth_day { 2000-12-24 }
  end
end