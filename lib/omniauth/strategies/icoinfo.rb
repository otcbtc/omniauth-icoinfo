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
          id: raw_info["id"],
          email: raw_info["email"]
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