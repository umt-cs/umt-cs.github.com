require 'csv'

module Jekyll
  class RosterTag < Liquid::Tag
    URLS = {
      'GitHub' => 'https://github.com',
      'LinkedIn' => 'https://linkedin.com/in',
    }

    def initialize(tag_name, text, tokens)
      super
      @filename = File.join(File.dirname(__FILE__), '../files/roster.csv')
      @filename = File.expand_path(@filename)
      @rows     = []
      CSV.foreach(@filename, :headers => true, :skip_blanks => true) do |row|
        @rows << row
      end
    end

    def render(context)
      s = []
      @rows.each do |row|
        s << render_row(row)
      end
      s.join("\n")
    end

    private

    def render_row(row)
      s = %w(<tr>)
      row.each do |field, value|
        field.strip!

        s << '<td class="%s">' % field

        if value && url = URLS[field]
          s << render_link_template(field, url, value.strip)
        elsif field == 'Homepage' && value
          s << render_link_template(field, value, '')
        else
          s << value
        end
        s << '</td>'
      end
      s << '</tr>'
      s.join
    end

    def render_link_template(text, base, var)
      '<a href="%s" rel="external">%s</a>' % [File.join(base, var), text]
    end
  end
end

Liquid::Template.register_tag('roster', Jekyll::RosterTag)
