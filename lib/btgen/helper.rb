require_relative 'bootstrap_table'

module Btgen
  module Helper
    def bootstrap_table(args = {})
      table = BootstrapTable.new args
      yield table
      table.to_html
    end
  end
end
