require "test_helper"

class LibVLCTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil LibVLC::VERSION
  end

  def test_that_libvlc_exists
    refute_nil LibVLC.vlc_version
  end
end
