require 'gem2deb/rake/testtask'
task :default do
  Rake::Task[:start_redis].invoke
  failed = false
  begin
    Rake::Task[:test].invoke
  rescue
    failed = true
  end
  Rake::Task[:stop_redis].invoke
  if failed
    fail 'Tests failed'
  end
end

task :start_redis do
    sh 'redis-server --daemonize yes --port 6379&'
end

Rake::TestTask.new do |t|
    t.libs << 'test' << '.'
    t.test_files = FileList['test/test_*.rb']
end

task :stop_redis do
    sh 'pkill redis-server'
end
