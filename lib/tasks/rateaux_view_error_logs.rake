namespace :log do
  desc 'View error logs'
  task :error do
    $!.backtrace.each do |x|
      puts x
      end
    end
end