require 'wuyao'
module Wuyao
  module Rails
    module Controller
      def self.included(controller)
        controller.extend(ClassMethods) 
      end
      
      attr_reader :wuyao_session 
      
      def set_wuyao_session
        @wuyao_session ||= Session.new(params)
      end
      
      module ClassMethods
        def acts_as_wuyao_controller
          before_filter :set_wuyao_session
        end
      end
    end
  end
end
