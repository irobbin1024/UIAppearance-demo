//
//  XYAppearanceManager.h
//  demo2
//
//  Created by irobbin on 2023/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYAppearanceManager : NSObject

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSInvocation *> * invocationMap;

+ (instancetype)instance;

- (void)appendWithClassName:(NSString *)calssName invocation:(NSInvocation *)invocation;

@end

NS_ASSUME_NONNULL_END
