require 'jwt'

class Auth
  ALGORITHM = 'HS256'
  leeway = 10 # seconds

  def self.decode(token)
    begin
      JWT.decode(token,
        auth_secret,
        true,
        { :exp_leeway => leeway, :algorithm => ALGORITHM }).first
    rescue JWT::ExpiredSignature
      nil
    end
  end

  def self.auth_secret
    #ENV["AUTH_SECRET"]
    "acomplexpassword"
  end
end  
