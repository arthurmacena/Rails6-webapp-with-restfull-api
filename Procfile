redis:    redis-server
sidekiq:  pg_ctl restart -l log/pg.log && bundle exec sidekiq -C config/sidekiq.yml
web:      bundle exec rails server -p 3000 --binding=0.0.0.0
