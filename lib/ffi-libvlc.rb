require "ffi"

require_relative "ffi-libvlc/constants"
require_relative "ffi-libvlc/version"

require_relative "ffi-libvlc/media"
require_relative "ffi-libvlc/media_player"
require_relative "ffi-libvlc/media_player/video"
require_relative "ffi-libvlc/media_player/audio"

module LibVLC
  extend FFI::Library
  ffi_lib LIBRARY_PATH

  attach_function :libvlc_new, [:int, :string], :pointer
  attach_function :libvlc_release, [:pointer], :void
  attach_function :libvlc_version, :libvlc_get_version, [], :string

  def self.instance
    @instance
  end

  def self.init(argc = 0, argv = nil)
    @instance = libvlc_new(argc, argv)
  end

  def self.shutdown
    libvlc_release(instance)
  end
end