class JsonWebToken
  class << self
    def encode(generated_token, expiration = 24.hours.from_now)
      generated_token[:expiration] = expiration.to_i
      JWT.encode(generated_token, Rails.application.secrets.secret_key_base)
      #rails app base key-- always unique to each application
      #creates unique api_token
    end

    def decode(api_token)
      body = JWT.decode(api_token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
