#!/usr/bin/env ruby
require 'twitter'
while true
    begin
        # Create a read write application from :
        # https://apps.twitter.com
        # authenticate it for your account
        # fill in the following
        config = {
            consumer_key:        'mDPelYmcdf2LAWOkqUSifVcKG',
            consumer_secret:     'qQpM55U36XmPXdaCrwtH92yxq9abBxm8eD9AaEq455pYkxpvjh',
            access_token:        '853344652036120577-thGfdqlDIXEc4TWOkr3hFWjFgqRU5TZ',
            access_token_secret: 'taahRUJQHNnD3Og2bQkh42gwzL6mNOugVmo4BWMBcGGZH'
        }
        rClient = Twitter::REST::Client.new config
        sClient = Twitter::Streaming::Client.new(config)

        # rClient.update("Testing") #  uncomment and run this, then navigate to https://twitter.com/jftestbot

        # set topic to watch
        topics = ['#easter']  # add more, seperated by commas, to watch more topics
        sClient.filter(:track => topics.join(',')) do |tweet|
            if tweet.is_a?(Twitter::Tweet)
              puts tweet.text
              rClient.fav tweet
            end
        end
    rescue
        puts 'error occurred, waiting for 5 seconds'
        sleep 5
    end
end
