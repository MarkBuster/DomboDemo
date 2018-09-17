//
//  UIView+TNTCategory.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/11.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TNTCategory)

- (void)drawCircle;//!< 圆形绘制

- (void)drawCirclebyRoundingCorners:(UIRectCorner)corners; //!< 指定圆角绘制
@end
