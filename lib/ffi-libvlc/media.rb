module LibVLC
  extend FFI::Library
  ffi_lib LIBRARY_PATH

  attach_function :libvlc_media_new_location, [:pointer, :string], :pointer
  attach_function :libvlc_media_new_path, [:pointer, :string], :pointer
  attach_function :libvlc_media_release, [:pointer], :pointer

  class Media
    def self.from_url(url)
      new( LibVLC.libvlc_media_new_location(LibVLC.instance, url))
    end

    def self.from_path(path)
      new( LibVLC.libvlc_media_new_path(LibVLC.instance, path) )
    end

    def initialize(pointer)
      @pointer = pointer
    end

    def pointer
      @pointer
    end
  end
end