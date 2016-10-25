class RedditClient
  include HTTParty

  attr_accessor :headers
  attr_reader :token, :base_url

  def initialize(user)
    @headers = {"Authorization": "bearer #{user.identity.access_token}", "User-Agent": "RedditWebDashboard/0.1"}
    @token = user.identity.access_token
    @base_url = "https://oauth.reddit.com/"
    @user = user
  end


  def front_page
    client = HTTParty.get(@base_url, :headers => @headers, :query => {:limit => 50})
    binding.pry
  end



  def refresh_access
    # METHOD TO REFRESH TOKEN WHEN RESPONSE  = 401 Unauthorized
  end

end













# DateTime.strptime("1477418075",'%s')
# :body => {:client_id => ENV["reddit_client_id"], :client_secret => ENV["reddit_client_secret"], :redirect_uri=>"http://localhost:3000/users/auth/reddit/callback"}
#   headers = {"Authorization": "bearer #{token}", "User-Agent": "RedditWebDashboard/0.1 by Emilio Corpus"}
#   query = {:limit => 50, :count => #{NUMBER OF ITEMS YOU HAVE RETRIEVED}}, :after/before => ["name"] of the listing i.e. t3_g7aj2 }
#     THIS WILL GET THE FRONT PAGE OF WHICHEVER USER AUTHORIZES IT
#   response = HTTParty.get("https://oauth.reddit.com/", :headers => headers, :query => query)
