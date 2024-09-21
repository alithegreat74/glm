project "glm"
    kind "StaticLib"
    language "C++"
    files{
        "glm/**.hpp",
        "glm/**.inl",
        "glm/detail/**.hpp",
        "glm/detail/**.inl",
        "glm/ext/**.hpp",
        "glm/ext/**.inl",
        "glm/gtc/**.hpp",
        "glm/gtc/**.inl",
        "glm/simd/**.hpp",
        "glm/simd/**.inl"
    }
    includedirs "glm"
    