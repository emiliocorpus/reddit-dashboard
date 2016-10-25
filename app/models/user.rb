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


  #   headers = {"Authorization": "bearer #{token}", "User-Agent": "RedditWebDashboard/0.1 by Emilio Corpus"}
  #   query = {:limit => 50, :count => #{NUMBER OF ITEMS YOU HAVE RETRIEVED}}, :after/before => ["name"] of the listing i.e. t3_g7aj2

  #     THIS WILL GET THE FRONT PAGE OF WHICHEVER USER AUTHORIZES IT
  #   response = HTTParty.get("https://oauth.reddit.com/", :headers => headers, :query => query)




  def email_required?
    false
  end

  def email_changed?
    false
  end

end
