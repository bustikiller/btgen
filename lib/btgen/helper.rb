require_relative 'bootstrap_table'

module Btgen
  module Helper
    def bootstrap_table(args = {})
      table = BootstrapTable.new args
      yield table
      table.to_html
    end

    def expand_collapsible_label(target_id)
      icon :plus, href: "##{target_id}", data: {toggle: 'collapse'}
    end

    def panel_with_body(*args)

      body_classes = ['panel-body']

      random_string = (0...8).map { (65 + rand(26)).chr }.join
      body_options = {id: "collapsible_#{random_string.downcase}"}
      title_fragments = []

      if args.last[:icon]
        title_fragments << icon(args.last[:icon][:type].to_sym, class: args.last[:icon][:class])
      end

      if args.last[:collapsible]
        body_classes << 'collapse'
        title_fragments << expand_collapsible_label(body_options[:id])
      end

      title_fragments << sanitize(args.last[:title])
      args.last[:title] = title_fragments.compact.inject(:+).html_safe

      panel(*args) do
        body_options[:class] = body_classes.join(' ')
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
