
require 'gem2deb/rake/testtask'

Gem2Deb::Rake::TestTask.new do |t|
    t.libs << 'test' << '.'
  t.test_files =  FileList['test/test_*.rb']
end
