//
//  XYProxy.m
//  demo2
//
//  Created by irobbin on 2023/12/10.
//

#import "XYProxy.h"
#import "XYAppearanceManager.h"

@interface XYProxy ()

@property (nonatomic, copy) NSString * className;


@end

@implementation XYProxy

- (instancetype)initWithTarget:(id)target {
    _target = target;
    self.className = NSStringFromClass([(NSObject *)target class]);
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[XYProxy alloc] initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [[XYAppearanceManager instance] appendWithClassName:self.className invocation:invocation];
//    [invocation setReturnValue:&null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

@end
