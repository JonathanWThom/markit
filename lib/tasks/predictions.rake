namespace :predictions do
  desc "Fetch the lastest DJIA data and create a prediction and accuracy report"
  task djia: :environment do
    DjiaData.new.generate_prediction
  end
end
