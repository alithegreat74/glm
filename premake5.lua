project "glm"
    kind "StaticLib"
    language "C++"
    files{
        "glm/**.cppm",
        "glm/**.hpp",
        "glm/**.inl",

        "glm/detail/**.hpp",
        "glm/detail/**.inl",
        "glm/detail/**.cpp",

        "glm/ext/**.hpp",
        "glm/ext/**.inl",

        "glm/gtc/**.hpp",
        "glm/gtc/**.inl",

        "glm/gtx/**.hpp",
        "glm/gtx/**.inl",

        "glm/simd/**.h"
    }
    includedirs ""
    cppdialect "C++20"
