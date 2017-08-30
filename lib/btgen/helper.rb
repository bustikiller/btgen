require_relative 'bootstrap_table'

module Btgen
  module Helper
    def bootstrap_table(args = {})
      table = BootstrapTable.new args
      yield table
      table.to_html
    end

    def expand_collapsible_label(target_id)
      content_tag(:span, ' + ', href: "##{target_id}", data: {toggle: 'collapse'})
    end

    def panel_with_body(*args)

      final_class = 'panel-body'
      collapsible = args.last[:collapsible]
      body_options = {}

      if collapsible
        final_class += ' collapse'
        random_string = (0...8).map { (65 + rand(26)).chr }.join
        body_options[:id] = "collapsible_#{random_string}"
        final_title = [ expand_collapsible_label(body_options[:id]), args.last[:title]].compact.inject(:+)
        args.last[:title] = sanitize(final_title, attributes: %w(href data-toggle)).html_safe
      end

      panel(*args) do
        body_options[:class] = final_class
        content_tag :div, body_options do
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
