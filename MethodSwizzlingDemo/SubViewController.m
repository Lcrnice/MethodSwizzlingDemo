//
//  SubViewController.m
//  MethodSwizzlingDemo
//
//  Created by Lcrnice on 16/4/23.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "SubViewController.h"

@implementation SubViewController

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"__subViewController befor super__");
    [super viewWillAppear:animated];
    NSLog(@"__subViewController after super__");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
