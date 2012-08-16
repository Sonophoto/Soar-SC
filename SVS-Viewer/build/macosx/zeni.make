# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = clang
endif

ifndef CXX
  CXX = clang++
endif

ifndef AR
  AR = ar
endif

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/zeni
  TARGETDIR  = ../../lib/univ_d
  TARGET     = $(TARGETDIR)/libzeni_d.dylib
  DEFINES   += -D_MACOSX -D_DEBUG -DDEBUG -DTEST_NASTY_CONDITIONS -DDISABLE_CPP11 -DGLEW_NO_GLU -DDISABLE_CG -DOGG_DLL= -DVORBIS_DLL= -DVORBISFILE_DLL= -DDISABLE_DX9 -DDISABLE_WGL -DTINYXML_DLL= -DTINYXML_EXT= -DZENI_DLL= -DZENI_EXT= -DZENI_AUDIO_DLL= -DZENI_AUDIO_EXT= -DZENI_CORE_DLL= -DZENI_CORE_EXT= -DZENI_GRAPHICS_DLL= -DZENI_GRAPHICS_EXT= -DZENI_NET_DLL= -DZENI_NET_EXT= -DZENI_REST_DLL= -DZENI_REST_EXT=
  INCLUDES  += -I../../jni/external/zenilib/zeni -I../../jni/external/sdl_net -I../../jni/external/sdl -I../../jni/external/tinyxml
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -fPIC -Qunused-arguments -stdlib=libc++ -ffast-math -fpch-preprocess -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib/univ_d -dynamiclib -flat_namespace -stdlib=libc++ -install_name @loader_path/libzeni_d.dylib
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llocal_tinyxml_d -framework Cocoa
  LDDEPS    += ../../lib/univ_d/liblocal_tinyxml_d.dylib
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/zeni
  TARGETDIR  = ../../lib/univ
  TARGET     = $(TARGETDIR)/libzeni.dylib
  DEFINES   += -D_MACOSX -DNDEBUG -DDISABLE_CPP11 -DGLEW_NO_GLU -DDISABLE_CG -DOGG_DLL= -DVORBIS_DLL= -DVORBISFILE_DLL= -DDISABLE_DX9 -DDISABLE_WGL -DTINYXML_DLL= -DTINYXML_EXT= -DZENI_DLL= -DZENI_EXT= -DZENI_AUDIO_DLL= -DZENI_AUDIO_EXT= -DZENI_CORE_DLL= -DZENI_CORE_EXT= -DZENI_GRAPHICS_DLL= -DZENI_GRAPHICS_EXT= -DZENI_NET_DLL= -DZENI_NET_EXT= -DZENI_REST_DLL= -DZENI_REST_EXT=
  INCLUDES  += -I../../jni/external/zenilib/zeni -I../../jni/external/sdl_net -I../../jni/external/sdl -I../../jni/external/tinyxml
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -Wall -fPIC -Qunused-arguments -stdlib=libc++ -ffast-math -fpch-preprocess -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib/univ -Wl,-x -dynamiclib -flat_namespace -stdlib=libc++ -install_name @loader_path/libzeni.dylib
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llocal_tinyxml -framework Cocoa
  LDDEPS    += ../../lib/univ/liblocal_tinyxml.dylib
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debuguniv)
  OBJDIR     = obj/Universal/Debug/zeni
  TARGETDIR  = ../../lib/univ_d
  TARGET     = $(TARGETDIR)/libzeni_d.dylib
  DEFINES   += -D_MACOSX -D_DEBUG -DDEBUG -DTEST_NASTY_CONDITIONS -DDISABLE_CPP11 -DGLEW_NO_GLU -DDISABLE_CG -DOGG_DLL= -DVORBIS_DLL= -DVORBISFILE_DLL= -DDISABLE_DX9 -DDISABLE_WGL -DTINYXML_DLL= -DTINYXML_EXT= -DZENI_DLL= -DZENI_EXT= -DZENI_AUDIO_DLL= -DZENI_AUDIO_EXT= -DZENI_CORE_DLL= -DZENI_CORE_EXT= -DZENI_GRAPHICS_DLL= -DZENI_GRAPHICS_EXT= -DZENI_NET_DLL= -DZENI_NET_EXT= -DZENI_REST_DLL= -DZENI_REST_EXT=
  INCLUDES  += -I../../jni/external/zenilib/zeni -I../../jni/external/sdl_net -I../../jni/external/sdl -I../../jni/external/tinyxml
  CPPFLAGS  +=  $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -arch i386 -arch x86_64 -fPIC -Qunused-arguments -stdlib=libc++ -ffast-math -fpch-preprocess -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib/univ_d -dynamiclib -flat_namespace -arch i386 -arch x86_64 -stdlib=libc++ -install_name @loader_path/libzeni_d.dylib
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llocal_tinyxml_d -framework Cocoa
  LDDEPS    += ../../lib/univ_d/liblocal_tinyxml_d.dylib
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),releaseuniv)
  OBJDIR     = obj/Universal/Release/zeni
  TARGETDIR  = ../../lib/univ
  TARGET     = $(TARGETDIR)/libzeni.dylib
  DEFINES   += -D_MACOSX -DNDEBUG -DDISABLE_CPP11 -DGLEW_NO_GLU -DDISABLE_CG -DOGG_DLL= -DVORBIS_DLL= -DVORBISFILE_DLL= -DDISABLE_DX9 -DDISABLE_WGL -DTINYXML_DLL= -DTINYXML_EXT= -DZENI_DLL= -DZENI_EXT= -DZENI_AUDIO_DLL= -DZENI_AUDIO_EXT= -DZENI_CORE_DLL= -DZENI_CORE_EXT= -DZENI_GRAPHICS_DLL= -DZENI_GRAPHICS_EXT= -DZENI_NET_DLL= -DZENI_NET_EXT= -DZENI_REST_DLL= -DZENI_REST_EXT=
  INCLUDES  += -I../../jni/external/zenilib/zeni -I../../jni/external/sdl_net -I../../jni/external/sdl -I../../jni/external/tinyxml
  CPPFLAGS  +=  $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -Wall -arch i386 -arch x86_64 -fPIC -Qunused-arguments -stdlib=libc++ -ffast-math -fpch-preprocess -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib/univ -Wl,-x -dynamiclib -flat_namespace -arch i386 -arch x86_64 -stdlib=libc++ -install_name @loader_path/libzeni.dylib
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llocal_tinyxml -framework Cocoa
  LDDEPS    += ../../lib/univ/liblocal_tinyxml.dylib
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/macosx_zeni.o \
	$(OBJDIR)/Camera.o \
	$(OBJDIR)/Collision.o \
	$(OBJDIR)/Color.o \
	$(OBJDIR)/Colors.o \
	$(OBJDIR)/Coordinate.o \
	$(OBJDIR)/File_Ops.o \
	$(OBJDIR)/Matrix4f.o \
	$(OBJDIR)/Quaternion.o \
	$(OBJDIR)/Quit_Event.o \
	$(OBJDIR)/Random.o \
	$(OBJDIR)/Resource.o \
	$(OBJDIR)/Serialization.o \
	$(OBJDIR)/String.o \
	$(OBJDIR)/Timer_HQ.o \
	$(OBJDIR)/Vector2f.o \
	$(OBJDIR)/Vector3f.o \
	$(OBJDIR)/XML.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking zeni
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning zeni
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	-$(SILENT) cp $< $(OBJDIR)
else
	$(SILENT) xcopy /D /Y /Q "$(subst /,\,$<)" "$(subst /,\,$(OBJDIR))" 1>nul
endif
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/macosx_zeni.o: ../../jni/external/zenilib/zeni/macosx_zeni.mm
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Camera.o: ../../jni/external/zenilib/zeni/Camera.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Collision.o: ../../jni/external/zenilib/zeni/Collision.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Color.o: ../../jni/external/zenilib/zeni/Color.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Colors.o: ../../jni/external/zenilib/zeni/Colors.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Coordinate.o: ../../jni/external/zenilib/zeni/Coordinate.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/File_Ops.o: ../../jni/external/zenilib/zeni/File_Ops.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Matrix4f.o: ../../jni/external/zenilib/zeni/Matrix4f.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Quaternion.o: ../../jni/external/zenilib/zeni/Quaternion.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Quit_Event.o: ../../jni/external/zenilib/zeni/Quit_Event.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Random.o: ../../jni/external/zenilib/zeni/Random.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Resource.o: ../../jni/external/zenilib/zeni/Resource.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Serialization.o: ../../jni/external/zenilib/zeni/Serialization.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/String.o: ../../jni/external/zenilib/zeni/String.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Timer_HQ.o: ../../jni/external/zenilib/zeni/Timer_HQ.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Vector2f.o: ../../jni/external/zenilib/zeni/Vector2f.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Vector3f.o: ../../jni/external/zenilib/zeni/Vector3f.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/XML.o: ../../jni/external/zenilib/zeni/XML.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)