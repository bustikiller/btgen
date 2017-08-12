require_relative 'btgen/helper'

module Btgen
  ActionView::Base.send :include, Helper
end
