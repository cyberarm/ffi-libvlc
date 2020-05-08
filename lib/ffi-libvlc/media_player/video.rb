  module LibVLC
    extend FFI::Library
    ffi_lib LIBRARY_PATH

    class MediaPlayer
      class Video
        def initialize
        end
      end
    end
  end
