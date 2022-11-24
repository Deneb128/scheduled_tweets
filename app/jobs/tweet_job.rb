class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    binding.irb
    return if tweet.published?
    return if tweet.publish_at > Time.current #if a tweet has been rescheduled to the future
    tweet.publish_to_twitter!
  end
end
