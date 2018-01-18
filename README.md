# OsXBGI
Borland Graphics Interface (BGI) Pascal (FPC) implementation for OS-X

This unit implements standard Pascal Graph unit that is not available for FPC under OSX.

This unit may be compiled either for Windows or OSX.
There are already several better Windows implementations (WinGraph or standard FPC Graph)
so this unit is intended to be used primarily with OSX.

This implementation uses GLFW (http://www.glfw.org/ - OpenGL library) as the base.

Pascal bindings for GLFW was taken from https://github.com/neslib/DelphiGlfw
Neslib.Glfw3.pas is used.

You'll need a compiled dynamic library: libglfw.3.2.dylib for this unit to work.

Constants and color names are taken from WinGraph(http://math.ubbcluj.ro/~sberinde/wingraph/)
