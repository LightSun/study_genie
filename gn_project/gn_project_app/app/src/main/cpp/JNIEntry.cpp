//
// Created by Administrator on 2020/11/18 0018.
//

#include <jni.h>
#include <stdio.h>
#include "system_wrappers/interface/timer_wrapper.h"
#include "system_wrappers/interface/thread_wrapper.h"
#include "and_log.h"

#ifdef __cplusplus
extern "C" {
#endif

gn::TimerWrapper* timer =NULL;
int32_t _timer_id;

int
main_timer(int argc, const char *path[]);

void timer_callback0(int32_t timerID, void* userData){
    LOGD("timer callback is invoked...tid = %u", gn::ThreadWrapper::GetThreadId());
}
int
main_timer(int argc, const char *path[]){
    LOGD("main_timer is invoked...tid = %u", gn::ThreadWrapper::GetThreadId());
    timer = gn::TimerWrapper::CreateTimer();
    _timer_id = timer->SetTimer(2000, timer_callback0, NULL);
    return _timer_id;
}


#ifdef __cplusplus
}
#endif

extern "C"
JNIEXPORT void JNICALL
Java_com_heaven7_android_gn_1project_app_MainActivity_nTestTimer(JNIEnv *env, jclass clazz) {
    main_timer(0, NULL);
}

extern "C"
JNIEXPORT void JNICALL
Java_com_heaven7_android_gn_1project_app_MainActivity_nReleaseTimer(JNIEnv *env, jclass clazz) {
    if(timer){
        timer->KillTimer(_timer_id);
        delete timer;
        timer = NULL;
    }
}