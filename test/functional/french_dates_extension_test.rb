require File.dirname(__FILE__) + '/../test_helper'

class FrenchDatesExtensionTest < Test::Unit::TestCase

  # Replace this with your real tests.
  def test_this_extension
    flunk
  end

  def test_initialization
    assert_equal File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'french_dates'), FrenchDatesExtension.root
    assert_equal 'French Dates', FrenchDatesExtension.extension_name
  end

end
