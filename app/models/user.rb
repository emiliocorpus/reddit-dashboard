class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
                  :recoverable, :rememberable, :trackable, :validatable,
              :omniauthable, :omniauth_providers => [:reddit]

  validates_presence_of :username

  def self.from_omniauth(auth)
    binding.pry
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.username = auth.info.name
       user.password = Devise.friendly_token[0,20]
     end
     binding.pry
  end



  def email_required?
    false
  end

  def email_changed?
    false
  end

end
