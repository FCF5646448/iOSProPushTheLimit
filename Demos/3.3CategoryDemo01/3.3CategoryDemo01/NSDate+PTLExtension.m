//
//  NSDate+PTLExtension.m
//  3.3CategoryDemo01
//
//  Created by 冯才凡 on 2018/6/7.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

#import "NSDate+PTLExtension.h"

@implementation NSDate (PTLExtension)
- (NSTimeInterval)ptl_timeIntervalUntilNow {
    return -[self timeIntervalSinceNow];
}
@end
