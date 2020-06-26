namespace :sentiments do
  desc "Records sentiments for NYT headlines"
  task nyt_headlines_us: :environment do
    SentimentCreator.new.nyt_headlines_us
  end
end
