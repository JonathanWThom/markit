# Setup

1. `bin/setup`
2. `rails db:seed`
3. `rails s`

# Ideas/Improvements

1. Make the model more powerful by incorporating more data.

2. Don't store all price records - they aren't necessary.

3. Support more indexes (S&P, Nasdaq, etc)

4. ~~Create a record of past predictions and how the bot has fared over time.~~

5. Create a "beat the bot" feature where users can log their own predictions.

6. Aggregate user predictions - psuedo "futures" market.

7. Make prediction task more robust - it is idempotent but in a hacky way.

8. Much nicer front end - it is setup for react with webpacker

9. Dockerize (for Heroku)

10. Add CI/GitHub actions

11. Support longer term predictions (end of week/month/year). These should mark
    when they were predicted, but then adjust as the target date gets closer.
