//
//  ViewController.m
//  MethodSwizzlingDemo
//
//  Created by Lcrnice on 16/4/23.
//  Copyright © 2016年 Lcrnice. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Method Origin
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"***__origin method before super__***");
    [super viewWillAppear:animated];
    NSLog(@"***__origin method after super__***");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[SubViewController new] animated:YES completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
