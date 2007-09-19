# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FrenchDatesExtension < Radiant::Extension
  version "1.0"
  description "provides a tag <r:frenchdate> that behaves like the <r:date> but giving french names for months, days, etc..."
  url "http://mat.cc/dev/radiant/french_dates"

  # define_routes do |map|
  #   map.connect 'admin/french_dates/:action', :controller => 'admin/french_dates'
  # end

  def activate
    Page.send :include, FrenchDatesTags
  end

  def deactivate
    # admin.tabs.remove "French Dates"
  end

end
