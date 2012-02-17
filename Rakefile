require 'rake/clean'

CLOBBER.include('_site')

def bexec(cmd)
  system("bundle exec #{cmd}")
end

desc 'Launch the Jekyll server'
task :server => :clobber do
  bexec 'jekyll --server --auto'
end

desc 'Build the site'
task :build => :clobber do
  bexec 'jekyll'
end

desc 'Deploy the site to ACM servers'
task :deploy => :build do
  system("rsync -avz _site/* acm:~/www/")
end
