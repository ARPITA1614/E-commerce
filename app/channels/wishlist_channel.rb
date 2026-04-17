class WishlistChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "wish"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
