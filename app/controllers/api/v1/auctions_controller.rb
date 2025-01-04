class Api::V1::AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    @auctions.each do |auction|
    end
  end
end
