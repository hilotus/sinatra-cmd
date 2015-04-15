require "thor"

module Sinatra
  module CLI
    class Generator < Thor::Group
      include Thor::Actions

      argument :app_name

      def self.source_root
        File.join(File.dirname(__FILE__), "../../../", "templates")
      end

      def create_models_dir
        keep_file "#{app_name}/app/models"
      end

      def create_routes_dir
        keep_file "#{app_name}/app/routes"
        template "routes/demo.rb.erb", "#{app_name}/routes/demo.rb"
      end

      def create_config
        template "config/database.yml.erb", "#{app_name}/config/database.yml"
        template "config/application.rb.erb", "#{app_name}/config/application.rb"
        template "config/boot.rb.erb", "#{app_name}/config/boot.rb"
        copy_file "config/environment.rb", "#{app_name}/config/environment.rb"
        copy_file "config/scheduler.rb", "#{app_name}/config/scheduler.rb"
      end

      def create_appfile
        copy_file ".gitignore", "#{app_name}/.gitignore"
        copy_file "Gemfile", "#{app_name}/Gemfile"
        copy_file "Rakefile", "#{app_name}/Rakefile"
        template "config.ru.erb", "#{app_name}/config.ru"
        template "README.md.erb", "#{app_name}/README.md"
      end

      def setup_rspec
        copy_file "sepc/spec_helper.rb", "#{app_name}/sepc/spec_helper.rb"
        copy_file ".rspec", "#{app_name}/.rspec"
      end

      def bundle_install
        system "cd #{app_name} && bundle install && cd ../"
      end

      protected

        def keep_file(destination)
          create_file "#{destination}/.keep"
        end
    end
  end
end
