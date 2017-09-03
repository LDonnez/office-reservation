class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable
  store :settings, accessors: [ :google_api_key, :google_calendar_id ], coder: JSON
end
