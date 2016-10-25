class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :password, :password_confirmation, :encrypted_password, :remember_me, :provider, :uid, :oauth_token, :oauth_expires_at

  devise :database_authenticatable, :registerable,
                  :recoverable, :rememberable, :trackable, :validatable,
              :omniauthable, :omniauth_providers => [:reddit]
  has_one :identity, :dependent => :destroy

  validates_presence_of :username

  def self.from_omniauth(auth)
    binding.pry
    identity = Identity.where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
       if identity.user == nil
         user = User.new
         user.username = auth.info.name
         user.password = Devise.friendly_token[0,20]
       end
       identity.user = user
       identity.access_token = auth['credentials']['token']
       identity.refresh_token = auth['credentials']['refresh_token']
       binding.pry
       identity.expires_at = auth['crendentials']['refresh_token']
       binding.pry
       identity.save
    end
    identity.user
  end







  def email_required?
    false
  end

  def email_changed?
    false
  end

end
