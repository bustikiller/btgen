require_relative 'bootstrap_table'

module Btgen
  module Helper
    def bootstrap_table(args = {})
      table = BootstrapTable.new args
      yield table
      table.to_html
    end

    def panel_with_body(*args)
      panel(*args) do
        content_tag :div, class: 'panel-body' do
          yield
        end
      end
    end

    def bootstrap_description(instance, attributes)
      content_tag :dl, class: 'dl-horizontal' do
        attributes.to_a.map do |(k, v)|
          (content_tag :dt, instance.class.human_attribute_name(k)) + (content_tag :dd, v)
        end.inject(:+)
      end
    end
  end
end
