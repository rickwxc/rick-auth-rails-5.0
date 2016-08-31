rake assets:precompile
RAILS_ENV=production bundle exec puma -C config/puma.rb 
