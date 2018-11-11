//
//  NSMutableString+PTLCapitalize.m
//  3.3CategoryDemo01
//
//  Created by 冯才凡 on 2018/6/7.
//  Copyright © 2018年 冯才凡. All rights reserved.
//

#import "NSMutableString+PTLCapitalize.h"

@implementation NSMutableString (PTLCapitalize)
- (void)ptl_capitalize {
    [self setString:[self capitalizedString]];
}
@end
