require 'csv'

module Jekyll
  class RosterTag < Liquid::Tag
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

    def render_row(row)
      s = %w(<tr>)
      row.each do |field, value|
        s << '<td class="%s">%s</td>' % [field, value]
      end
      s << '</tr>'
      s.join
    end
  end
end

Liquid::Template.register_tag('roster', Jekyll::RosterTag)
