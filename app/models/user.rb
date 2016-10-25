class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :password, :password_confirmation, :encrypted_password, :remember_me, :provider, :uid, :oauth_token, :oauth_expires_at

  devise :database_authenticatable, :registerable,
                  :recoverable, :rememberable, :trackable, :validatable,
              :omniauthable, :omniauth_providers => [:reddit]
  has_many :identities, :dependent => :destroy

  validates_presence_of :username

  def self.from_omniauth(auth)
    identity = Identity.where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
       if identity.user == nil
         user = User.new
         user.username = auth.info.name
         user.password = Devise.friendly_token[0,20]
         user.save
       end
       identity.user = user
       identity.access_token = auth['credentials']['token']
       identity.expires_at = auth['credentials']['expires_at']
       identity.save
       identity.user
    end
  end


  #   headers = {"Authorization": "bearer #{token}", "User-Agent": "RedditWebDashboard/0.1 by Emilio Corpus"}
  #   query = {:limit => 50, :count => #{NUMBER OF ITEMS YOU HAVE RETRIEVED}}, :after/before => ["name"] of the listing i.e. t3_g7aj2 }

  #     THIS WILL GET THE FRONT PAGE OF WHICHEVER USER AUTHORIZES IT
  #   response = HTTParty.get("https://oauth.reddit.com/", :headers => headers, :query => query)




  def email_required?
    false
  end

  def email_changed?
    false
  end

end
