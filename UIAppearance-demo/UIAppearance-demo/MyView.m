//
//  MyView.m
//  demo2
//
//  Created by irobbin on 2023/12/10.
//

#import "MyView.h"
#import "XYProxy.h"

@implementation MyView

+ (instancetype)xy_appearance {
    return (MyView *)[XYProxy proxyWithTarget:self];
}

@end
