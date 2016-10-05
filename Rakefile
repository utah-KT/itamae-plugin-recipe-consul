require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :spec => "spec:all"

HOSTS = %w(centos65 centos70 debian8)
NODES = %w(enabled disabled)

namespace :spec do
  task :all => HOSTS

  HOSTS.each do |host|
    namespace host do
      NODES.each do |node|
        desc "Run serverspec to #{host} (using node_#{node}.yml)"
        RSpec::Core::RakeTask.new(node.to_sym) do |t|
          puts "Running tests to #{host} ..."
          ENV["TARGET_HOST"] = host
          ENV["NODE"] = node
          t.pattern = "spec/**/*_spec.rb"
        end
      end
    end
  end
end

namespace :itamae do
  task :all => HOSTS

  HOSTS.each do |host|
    namespace host do
      NODES.each do |node|
        desc "Run itamae to #{host} (using node_#{node}.yml)"
        task node do
          sh "itamae ssh --host=#{host} --vagrant --node-yaml=recipes/node_#{node}.yml recipes/install.rb"
        end
      end
    end
  end
end
