task :send_email do
  daily_email = DailyEmail.new
  daily_email.send_daily_email
end