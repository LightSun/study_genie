--
-- Copyright 2010-2020 Branimir Karadzic. All rights reserved.
-- License: https://github.com/bkaradzic/bimg#license-bsd-2-clause
--
local action = _ACTION

newoption {
	trigger = "with-shared-lib",
	description = "Enable building shared library.",
}

newoption {
	trigger = "with-tools",
	description = "Enable building tools.",
}

--defines macro: GN_DLL _WIN32 CCORE_MAC CCORE_LINUX CCORE_IOS
solution "gn_core"
	configurations {
		"Debug",
		"Release",
	}
	configuration { "android*" }
		kind "SharedLib"
		targetextension ".so"
		linkoptions {
			"-shared",
		}
		links {
			"log",
		}
		defines{
			"CCORE_ANDROID"
		}
	
	configuration { "android*" ,"Debug"}
		linkoptions {
			"-Wl,-soname,libgn_core-Debug.so",
		}

	configuration { "android*" ,"Release"}
		linkoptions {
			"-Wl,-soname,libgn_core-Release.so",
		}		
			
	if _ACTION == "xcode4" then
		platforms {
			"Universal",
		}
	else
		platforms {
			"x32",
			"x64",
			"Native", -- for targets where bitness is not specified
		}
	end

	language "C++"
	startproject "example-00-helloworld"

BX_DIR = path.getabsolute("..")
BX_BUILD_DIR = path.join(BX_DIR, ".build")
BX_THIRD_PARTY_DIR = path.join(BX_DIR, "3rdparty")

-- enable gcc fla
dofile "toolchain.lua"
toolchain(BX_BUILD_DIR, BX_THIRD_PARTY_DIR)

function copyLib()
end

group "libs"
dofile "gn_wrapper.lua"
