class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    user = AdminUser.where(email: access_token.info.email).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = AdminUser.create(email: access_token.info.email,
                              password: Devise.friendly_token[0,20]
      )
    end
    user.name = access_token.info.name
    user.image = access_token.info.image
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.save
    user
  end
end
