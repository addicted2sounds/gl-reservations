module ApplicationHelper
  def glyph(*names)
    content_tag :span, nil, class: names.map{|name| "glyphicon glyphicon-#{name.to_s.gsub('_','-')}" }
  end
end
