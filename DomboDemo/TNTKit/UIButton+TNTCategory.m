//
//  UIButton+TNTCategory.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "UIButton+TNTCategory.h"
#import "TNTTools.h"
@implementation UIButton (TNTCategory)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[TNTTools createImageWithColor:backgroundColor] forState:state];
}

@end
