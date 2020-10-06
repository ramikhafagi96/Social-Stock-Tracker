class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        puts Rails.application.credentials.iex_client
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_pk],
            secret_token: Rails.application.credentials.iex_client[:sandbox_api_sk],
            endpoint: 'https://sandbox.iexapis.com/v1/'
          )
        client.price(ticker_symbol)
    end
end
