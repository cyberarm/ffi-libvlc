module LibVLC
  extend FFI::Library
  ffi_lib LIBRARY_PATH

  attach_function :libvlc_media_player_new, [:pointer], :pointer
  attach_function :libvlc_media_player_new_from_media, [:pointer], :pointer
  attach_function :libvlc_media_player_release, [:pointer], :pointer

  attach_function :libvlc_media_player_get_state, [:pointer], :int

  attach_function :libvlc_media_player_is_playing, [:pointer], :bool
  attach_function :libvlc_media_player_play, [:pointer], :int
  attach_function :libvlc_media_player_pause, [:pointer], :void
  attach_function :libvlc_media_player_stop, [:pointer], :void

  attach_function :libvlc_media_player_get_length, [:pointer], :int
  attach_function :libvlc_media_player_get_time, [:pointer], :int
  attach_function :libvlc_media_player_set_time, [:pointer, :int, :bool], :int

  class MediaPlayer
    def initialize(media)
      @media = media

      @pointer = LibVLC.libvlc_media_player_new_from_media(media.pointer)
    end

    def pointer
      @pointer
    end

    def play
      LibVLC.libvlc_media_player_play(@pointer)
    end

    def buffering?
      LibVLC.libvlc_media_player_get_state(@pointer) <= 1
    end

    def playing?
      LibVLC.libvlc_media_player_is_playing(@pointer)
    end

    def pause
      LibVLC.libvlc_media_player_pause(@pointer)
    end

    def stop
      LibVLC.libvlc_media_player_stop(@pointer)
    end
  end
end