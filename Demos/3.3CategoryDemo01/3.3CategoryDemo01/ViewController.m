//
//  ViewController.m
//  3.3CategoryDemo01
//
//  Created by 冯才凡 on 2018/6/7.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableString+PTLCapitalize.h"
#import "NSDate+PTLExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableString * str = [NSMutableString stringWithString:@"afDfSDss"];
    [str ptl_capitalize];
    NSLog(@"%@",str);
    
    NSDate * d = [[NSDate alloc] initWithTimeIntervalSinceNow:1234];
    NSLog(@"%@",d);
    [d ptl_timeIntervalUntilNow];
    NSLog(@"%@",d);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
