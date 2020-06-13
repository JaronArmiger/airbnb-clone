class User < ApplicationRecord
  has_one_attached :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
  	data = access_token.info
  	user = User.where(email: data['email']).first
  	unless user
  		user = User.create( name: data['name'],
                          email: data['email'],
  							          password: Devise.friendly_token[0,20] )
  	end
  	user
  end

  def display_profile_picture
    return @pic if @pic
    if profile_picture.attached?
      @pic = profile_picture
    else
      @pic = "default.jpg"
    end
  end
end
