namespace :predictions do
  desc "Fetch the lastest DJIA data and create a prediction"
  task djia: :environment do
    DjiaData.new.generate_prediction
  end
end
