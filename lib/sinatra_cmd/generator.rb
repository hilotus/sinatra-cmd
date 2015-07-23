require "thor"

module SinatraCmd
  class Generator < Thor::Group
    include Thor::Actions

    argument :app_name

    def self.source_root
      File.join(File.dirname(__FILE__), "../../", "templates")
    end

    def setup_utils
      keep_file "#{app_name}/utils"
    end

    def setup_helpers
      keep_file "#{app_name}/helpers"
      template "helpers/application.rb.erb", "#{app_name}/helpers/application.rb"
      template "helpers/error_handling.rb.erb", "#{app_name}/helpers/error_handling.rb"
    end

    def setup_models
      keep_file "#{app_name}/models"
    end

    def setup_routes
      keep_file "#{app_name}/routes"
      template "routes/demo.rb.erb", "#{app_name}/routes/demo.rb"
    end

    def setup_config
      template "config/mongo_mapper.yml.erb", "#{app_name}/config/mongo_mapper.yml"
      template "config/application.rb.erb", "#{app_name}/config/application.rb"
      template "config/boot.rb.erb", "#{app_name}/config/boot.rb"
      copy_file "config/environment.rb", "#{app_name}/config/environment.rb"

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
