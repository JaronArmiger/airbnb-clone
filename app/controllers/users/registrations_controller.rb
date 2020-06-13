# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  protected
    
      def after_update_path_for(resource_or_scope)
        user_path(resource_or_scope)
      end
end
