require 'active_support/concern'

module Typus
  module Controller
    module Navigation

      extend ActiveSupport::Concern

      included do
        before_action :set_resources_action_on_lists, :only => [:index, :trash]
        before_action :set_resources_action, :only => [:new, :create, :edit, :show]
      end

      def set_resources_action_on_lists
        add_resources_action("Add", {:action => "new"})
      end
      private :set_resources_action_on_lists

      def set_resources_action
        unless params[:_popup] && !params[:_input]
          add_resources_action('Back to list', {:action => 'index', :id => nil})
        end
      end
      private :set_resources_action

    end
  end
end
