require_relative 'btgen/btgen_helper'

module Btgen
  class Railtie < Rails::Railtie
    initializer 'btgen.view_helpers' do
      ActionView::Base.send :include, BtgenHelper
    end
  end
end
