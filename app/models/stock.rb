class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    validates :name, :ticker, presence: true


    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_pk],
            secret_token: Rails.application.credentials.iex_client[:sandbox_api_sk],
            endpoint: 'https://sandbox.iexapis.com/v1/'
          )
        begin 
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end

    def self.update_prices
        stocks = Stock.all
        stocks.each do |stock|
            client = IEX::Api::Client.new(
                publishable_token: Rails.application.credentials.iex_client[:sandbox_api_pk],
                secret_token: Rails.application.credentials.iex_client[:sandbox_api_sk],
                endpoint: 'https://sandbox.iexapis.com/v1/'
              )
            begin 
                price = client.price(stock.ticker)
                stock.last_price = price
                stock.save
            rescue => exception
                return nil
            end
        end
        
    end

    def self.check_db(ticker_symbol)
        begin 
            where(ticker: ticker_symbol).first
        rescue => exception
            new_lookup(ticker_symbol)
        end
    end
end
