module Concerns
  module Namespaceable
    module ClassMethods
      def controller_name
        self.name.downcase.gsub(/controller/, "")
      end
      def set_configs
        set :views, Proc.new { File.join(root, "../views/", self.controller_name) }
        set :erb, layout: :'../layout'
      end
    end
  end
end
