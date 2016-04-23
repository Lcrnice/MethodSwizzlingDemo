//
//  UIViewController+CRSwizzling.m
//  MethodSwizzlingDemo
//
//  Created by Lcrnice on 16/4/23.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "UIViewController+CRSwizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (CRSwizzling)

+ (void)load {
    [self cr_swizzlingMethod:@selector(viewWillAppear:)
                  withAltSEL:@selector(cr_viewWillAppear:)];
}

#pragma mark - Method Swizzling
+ (void)cr_swizzlingMethod:(SEL)originSEL withAltSEL:(SEL)altSEL {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = originSEL;
        SEL swizzledSelector = altSEL;
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
        
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

#pragma mark - Custom Method
- (void)cr_viewWillAppear:(BOOL)animated {
    NSLog(@"swizzling method before super");
    [self cr_viewWillAppear:animated];
    NSLog(@"yoho, swift~");
    NSLog(@"swizzling method after super");
}

@end
