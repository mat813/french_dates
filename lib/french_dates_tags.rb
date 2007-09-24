require 'date'

Date.const_set 'MONTHNAMES', [nil] + %w(janvier février mars avril mai juin juillet
			  août septembre octobre novembre décembre)

Date.const_set 'DAYNAMES', %w(dimanche lundi mardi mercredi jeudi vendredi samedi)

Date.const_set 'ABBR_MONTHNAMES', [nil] + %w(jan fév mar avr mai jui
			       jul aoû sep oct nov déc)

Date.const_set 'ABBR_DAYNAMES', %w(dim lun mar mer jeu ven sam)

class Time
  public :to_date, :to_datetime
end


module FrenchDatesTags
  include Radiant::Taggable

  desc %{
    Affiche la date en fran�ais.
  }
  tag 'french_date' do |tag|
    page = tag.locals.page
    format = (tag.attr['format'] || '%A %e %B %Y')
    time_attr = tag.attr['for']
    date = if time_attr
	     case
	     when time_attr == 'now'
	       DateTime.now
	     when ['published_at', 'created_at', 'updated_at'].include?(time_attr)
	       page[time_attr].to_datetime
	     else
	       raise TagError, "Invalid value for 'for' attribute."
	     end
	   else
	     page.published_at.to_datetime || page.created_at.to_datetime
	   end
    date.strftime(format)
  end

  desc %{
    Affiche la date en fran�ais
  }
  tag 'comment:french_date' do |tag|
    comment = tag.locals.comment
    format = (tag.attr['format'] || '%A %e %B %Y')
    date = comment.created_at.to_datetime
    date.strftime(format)
  end
end
