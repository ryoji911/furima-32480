FactoryBot.define do
  factory :user do
    nickname { 'ryoji' }
    email { 'test@test' }
    password { 'aaa111' }
    password_confirmation { 'aaa111' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birth_day { '1988-12-24' }
  end
end