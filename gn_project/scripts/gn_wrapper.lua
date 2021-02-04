local action = _ACTION

print("BX_DIR", BX_DIR)

local function addPath(dir, p)
   local a = path.join(dir, p)
   --print("addPath: ", a)
   return a;
end


project "gn_wrapper"
	kind "StaticLib" --StaticLib, SharedLib，ConsoleApp
	targetextension ".a"
	includedirs {
		BX_DIR,
		--addPath(BX_DIR, "system_wrappers/interface"),
		addPath(BX_DIR, "modules/LogModule"),
		--addPath(BX_DIR, "system_wrappers/source/spreadsortlib"), 
	}
	files{
	   addPath(BX_DIR, "system_wrappers/source/**.cc"), 	  
	   addPath(BX_DIR, "modules/LogModule/log_module.cpp"),
	}
    configuration {"android-*"}
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
		defines{
		   "CCORE_THREAD_RR", "CCORE_CLOCK_TYPE_REALTIME"
		}
	 
	configuration {"mingw-*"}
	    includedirs{
		   "-isystem $(MINGW)/x86_64-w64-mingw32/include"
		}
		libdirs{
		   "$(MINGW)/x86_64-w64-mingw32/lib"		   
		}
	    excludes{
			addPath(BX_DIR, "system_wrappers/source/*_oc.cc"), 
			addPath(BX_DIR, "system_wrappers/source/*_mac.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_posix.cc"), 			
			addPath(BX_DIR, "system_wrappers/source/*_test_win.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_test_oc.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_test_posix.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_unittest.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_unittest_disabled.cc"),
			
			addPath(BX_DIR, "system_wrappers/source/*_android.cc"), 
			addPath(BX_DIR, "system_wrappers/source/logcat_trace_context.cc"), -- android
		} 
		links{
			"user32", "winmm"  
		} 
		defines{
			"_WIN32", "WIN32", "CCORE_WIN"
		}

    configuration {"linux-*"}
        excludes{
			addPath(BX_DIR, "system_wrappers/source/*_oc.cc"), 
			addPath(BX_DIR, "system_wrappers/source/*_mac.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_win.cc"), 			
			addPath(BX_DIR, "system_wrappers/source/*_test_win.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_test_oc.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_test_posix.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_unittest.cc"),
			addPath(BX_DIR, "system_wrappers/source/*_unittest_disabled.cc"),
            addPath(BX_DIR, "system_wrappers/source/*_android.cc"), --android
			addPath(BX_DIR, "system_wrappers/source/logcat_trace_context.cc"), -- android
		} 
        defines{
            "CCORE_LINUX", "CCORE_THREAD_RR", "CCORE_POSIX"
        }
 
	
	if _OPTIONS["enable_data_log"] then
	    excludes{
			addPath(BX_DIR, "system_wrappers/source/data_log_no_op.cc"), 
		}
	else
	    excludes{
			addPath(BX_DIR, "system_wrappers/source/data_log.cc"), 
		}
	end
	configuration { "linux-*" }
		buildoptions {
			"-fPIC",
		}

	configuration {}
