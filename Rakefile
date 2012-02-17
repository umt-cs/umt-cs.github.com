require 'rake/clean'

CLOBBER.include('_site')

def bexec(cmd)
  system("bundle exec #{cmd}")
end

desc 'Launch the Jekyll server'
task :server do
  bexec 'jekyll --server'
end

desc 'Build the site'
task :build do
  bexec 'jekyll'
end
