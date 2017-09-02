require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Icoinfo < OmniAuth::Strategies::OAuth2
      option :name, "icoinfo"
      option :client_options, {
               site: "http://icoinfo.dev",
               authorize_url: "/oauth/authorize"
             }

      def request_phase
        super
      end

      info do
        {
          email: raw_info["email"],
          name: raw_info["user_name"],
          image: raw_info["image"],
          identity_confirmed: raw_info["identity_confirmed_at"]
        }
      end

      uid { raw_info["id"] }

      def raw_info
        @raw_info ||= access_token.get("/api/v1/account/users.json").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
