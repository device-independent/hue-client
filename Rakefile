require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"

require 'webmock/rspec'

RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new do |t|
  t.files = Dir["lib/**/*.rb"]
end

desc "Run tests and generate docs"
task default: [:spec]

desc "Document the library"
task doc: [:yard]

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -I  extra -r hue/client"
end

desc "List out the Routes"
task :routes do
  require 'hue/client'
  require 'terminal-table'

  row_display = ->(row) do
    [row.name, row.path]
  end

  routes = Hue::Client.routes
  rows   = routes.map { |r| row_display.call(r) }

  table_attributes = {
    :title    => 'Supported Hue Client Routes',
    :headings => ['Route Name (Link Relationship)', 'URI Template'],
    :rows     => rows
  }

  table = Terminal::Table.new(table_attributes)
  puts table
end
