require "thor"

module SinatraCmd
  class Generator < Thor::Group
    include Thor::Actions

    argument :app_name

    def self.source_root
      File.join(File.dirname(__FILE__), "../../", "templates")
    end

    def setup_utils
      keep_file "#{app_name}/app/utils"
    end

    def setup_helpers
      keep_file "#{app_name}/app/helpers"
      template "app/helpers/application.rb.erb", "#{app_name}/app/helpers/application.rb"
      template "app/helpers/error_handling.rb.erb", "#{app_name}/app/helpers/error_handling.rb"
    end

    def setup_models
      keep_file "#{app_name}/app/models"
    end

    def setup_routes
      keep_file "#{app_name}/app/routes"
      template "app/routes/demo.rb.erb", "#{app_name}/app/routes/demo.rb"
    end

    def setup_config
      template "config/database.yml.erb", "#{app_name}/config/database.yml"
      template "config/application.rb.erb", "#{app_name}/config/application.rb"
      template "config/boot.rb.erb", "#{app_name}/config/boot.rb"
      copy_file "config/environment.rb", "#{app_name}/config/environment.rb"
      copy_file "config/scheduler.rb", "#{app_name}/config/scheduler.rb"

      # i18n
      copy_file "config/i18n/en-us.yml", "#{app_name}/config/i18n/en-us.yml"
      copy_file "config/i18n/zh-cn.yml", "#{app_name}/config/i18n/zh-cn.yml"
    end

    def setup_appfile
      copy_file ".gitignore", "#{app_name}/.gitignore"
      copy_file "Gemfile", "#{app_name}/Gemfile"
      copy_file "Rakefile", "#{app_name}/Rakefile"
      template "config.ru.erb", "#{app_name}/config.ru"
      template "README.md.erb", "#{app_name}/README.md"
    end

    def setup_rspec
      keep_file "#{app_name}/spec"
      copy_file ".rspec", "#{app_name}/.rspec"
      copy_file "spec/spec_helper.rb", "#{app_name}/spec/spec_helper.rb"
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
