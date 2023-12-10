//
//  XYAppearanceManager.m
//  demo2
//
//  Created by irobbin on 2023/12/10.
//

#import "XYAppearanceManager.h"
@import UIKit;
#import <objc/runtime.h>

@implementation UIView (HookAddSubview)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(addSubview:);
        SEL swizzledSelector = @selector(hook_addSubview:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)hook_addSubview:(UIView *)view {
    // 在这里可以添加你自定义的代码，对addSubview方法进行hook操作
    NSLog(@"Hooked addSubview: %@", view);
    
    // 调用原始的addSubview方法
    [self hook_addSubview:view];
    
    NSInvocation * invocation = [[XYAppearanceManager instance].invocationMap objectForKey:NSStringFromClass(view.class)];
    if (invocation) {
        invocation.target = view;
        [invocation invoke];
    }
}

@end

@implementation XYAppearanceManager

+ (instancetype)instance {
    static XYAppearanceManager * obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
    });
    return obj;
}

- (NSMutableDictionary<NSString *,NSInvocation *> *)invocationMap {
    if (_invocationMap == nil) {
        _invocationMap = [NSMutableDictionary dictionary];
    }
    return _invocationMap;
}

- (void)appendWithClassName:(NSString *)calssName invocation:(NSInvocation *)invocation {
    self.invocationMap[calssName] = invocation;
}

@end
