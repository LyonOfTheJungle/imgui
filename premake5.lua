-- Project outline for compiling imgui, link as a static lib
project "imgui"
    kind "staticlib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    -- Only include specific files
    files {
        "./imconfig.h",
        "./imgui_draw.cpp",
        "./imgui_internal.h",
        "./imgui_tables.cpp",
        "./imgui_widgets.cpp",
        "./imgui.cpp",
        "./imgui.h",
        "./imstb_rectpack.h",
        "./imstb_textedit.h",
        "./imstb_truetype.h"
    }

    includedirs {
        './',
        '../glfw/include'
    }

    -- Windows Compiler Only
    filter "action:vs2022"
        architecture "x86_64"
        files {
            "./backends/imgui_impl_dx12.cpp",
            "./backends/imgui_impl_dx12.h",
            "./backends/imgui_impl_glfw.cpp",
            "./backends/imgui_impl_glfw.h",
        }

    -- Build Settings
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines {
            "DEBUG"
        }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        defines {
            "RELEASE"
        }