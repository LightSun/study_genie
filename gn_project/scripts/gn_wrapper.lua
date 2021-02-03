local action = _ACTION

print("BX_DIR", BX_DIR)

local function addPath(dir, p)
   local a = path.join(dir, p)
   print("addPath: ", a)
   return a;
end


project "gn_wrapper"
	kind "StaticLib" --StaticLib, SharedLib
	targetextension ".a"
	includedirs {
		BX_DIR,
		addPath(BX_DIR, "system_wrappers/interface"),
		addPath(BX_DIR, "modules/LogModule"),
	}
	files{
	   addPath(BX_DIR, "system_wrappers/source/**.cc"), 
	   addPath(BX_DIR, "modules/LogModule/log_module.cpp"),
	}
	excludes{
		addPath(BX_DIR, "system_wrappers/source/*_oc.cc"), 
		addPath(BX_DIR, "system_wrappers/source/*_mac.cc"),
		addPath(BX_DIR, "system_wrappers/source/*_win.cc"), 			
		addPath(BX_DIR, "system_wrappers/source/*_test_win.cc"),
		addPath(BX_DIR, "system_wrappers/source/*_test_oc.cc"),
		addPath(BX_DIR, "system_wrappers/source/*_test_posix.cc"),
		addPath(BX_DIR, "system_wrappers/source/*_unittest.cc"),
		addPath(BX_DIR, "system_wrappers/source/*_unittest_disabled.cc"),
	} 

	configuration { "linux-*" }
		buildoptions {
			"-fPIC",
		}

	configuration {}