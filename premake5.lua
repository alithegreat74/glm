configurations { "Debug", "Release" }
architecture "x86_64"

-- Set C++ language version based on configuration options
cppdialect "C++17"

filter "configurations:Debug"
    defines { "DEBUG" }
    symbols "On"

filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "On"

filter {}

project "glm"
    kind "StaticLib" -- Change to "SharedLib" for dynamic library
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin-int/%{cfg.buildcfg}"
    
    files { "glm/**.hpp", "glm/**.cpp" } -- Include your source files

    includedirs { "" }

    filter "system:windows"
        defines { "GLM_FORCE_WINDOWS" }

    filter "system:linux"
        defines { "GLM_FORCE_LINUX" }

    filter "system:macosx"
        defines { "GLM_FORCE_MACOS" }

    -- Set SIMD options if needed (just examples, needs your logic)
    filter { "options:simd=sse2" }
        defines { "GLM_FORCE_INTRINSICS" }
        buildoptions { "-msse2" }

    filter { "options:simd=avx" }
        defines { "GLM_FORCE_INTRINSICS" }
        buildoptions { "-mavx" }

    -- Set C++ version based on a project option (default is C++17 here)
    filter { "options:c++20" }
        cppdialect "C++20"
        defines { "GLM_FORCE_CXX20" }

    filter { "options:c++17" }
        cppdialect "C++17"
        defines { "GLM_FORCE_CXX17" }

    filter { "options:c++14" }
        cppdialect "C++14"
        defines { "GLM_FORCE_CXX14" }

    filter { "options:c++11" }
        cppdialect "C++11"
        defines { "GLM_FORCE_CXX11" }

    filter { "options:c++98" }
        cppdialect "C++98"
        defines { "GLM_FORCE_CXX98" }

    -- Handle fast-math option
    filter { "options:fastmath" }
        buildoptions { "-ffast-math" }

    -- Disable fast-math for precise floating point operations
    filter { "options:!fastmath" }
        buildoptions { "/fp:precise" }

    -- SIMD options for MSVC
    filter { "system:windows", "options:simd=avx" }
        buildoptions { "/arch:AVX" }
    
    -- Test building option
    filter { "options:buildtests" }
        -- Add test files here or add a separate test project
        files { "test/**.cpp", "test/**.h" }
        kind "ConsoleApp"

-- Additional build/install options can be added here

-- Custom options for the project (c++ standard, simd, etc.)
newoption {
    trigger = "c++20",
    description = "Build with C++20 standard"
}

newoption {
    trigger = "c++17",
    description = "Build with C++17 standard"
}

newoption {
    trigger = "c++14",
    description = "Build with C++14 standard"
}

newoption {
    trigger = "c++11",
    description = "Build with C++11 standard"
}

newoption {
    trigger = "c++98",
    description = "Build with C++98 standard"
}

newoption {
    trigger = "fastmath",
    description = "Enable fast math optimizations"
}

newoption {
    trigger = "simd",
    value = "SIMD",
    description = "Enable SIMD optimizations (sse2, avx, etc.)",
    allowed = {
        { "sse2", "SSE2" },
        { "sse3", "SSE3" },
        { "ssse3", "SSSE3" },
        { "sse4_1", "SSE4.1" },
        { "sse4_2", "SSE4.2" },
        { "avx", "AVX" },
        { "avx2", "AVX2" },
        { "none", "None" }
    }
}

newoption {
    trigger = "buildtests",
    description = "Build test programs"
}
