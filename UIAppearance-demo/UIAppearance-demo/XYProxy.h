//
//  XYProxy.h
//  demo2
//
//  Created by irobbin on 2023/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYProxy : NSProxy

@property (nullable, nonatomic, strong) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
