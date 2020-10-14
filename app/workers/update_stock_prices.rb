require 'sidekiq-cron'
class UpdateStockPrices
    include Sidekiq::Worker

    def perform(*args)
        Stock.update_prices
        puts "Updated"
    end
end

Sidekiq::Cron::Job.create(name: 'Update Stock Prices - every 1min', cron: '* * * * *', class: 'UpdateStockPrices') # execute at every 1 minutes