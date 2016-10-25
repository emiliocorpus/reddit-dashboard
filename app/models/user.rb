class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :password, :password_confirmation, :encrypted_password, :remember_me, :provider, :uid, :oauth_token, :oauth_expires_at

  devise :database_authenticatable, :registerable,
                  :recoverable, :rememberable, :trackable, :validatable,
              :omniauthable, :omniauth_providers => [:reddit]

  validates_presence_of :username

  def self.from_omniauth(auth)
     user = User.where(:provider => auth.provider, :username => auth.info.name, :uid => auth.uid)
     binding.pry
     unless user
       binding.pry
       user = User.create(
                         provider:auth.provider,
                         uid:auth.uid,
                         username:auth.info.name,
                         password:Devise.friendly_token[0,20]
        )
     end
     user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
