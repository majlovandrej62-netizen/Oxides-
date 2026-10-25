#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <unistd.h>
#import <stdlib.h>
#import <dlfcn.h>
#import <mach-o/dyld.h>
#import <string.h>

%hookf(void, exit, int status) {
    NSLog(@"[Bypass] Blocked exit");
}

%hookf(void, _exit, int status) {
    NSLog(@"[Bypass] Blocked _exit");
}

%hookf(const char*, _dyld_get_image_name, uint32_t image_index) {
    const char* name = %orig;
    if (name && (strstr(name, "Bypass") || strstr(name, "Cheat") || strstr(name, "H5GG") || strstr(name, "substrate"))) {
        return "/usr/lib/libSystem.B.dylib"; 
    }
    return name;
}
