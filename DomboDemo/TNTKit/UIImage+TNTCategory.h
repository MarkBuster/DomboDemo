//
//  UIImage+TNTCategory.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TNTCategory)

+ (UIImage *)rotateImage:(UIImage *)aImage; //!< 这个干啥的不知道
+ (UIImage*)thumbnailOfImage:(UIImage*)image withSize:(CGSize)aSize; //!< 压缩图片至指定大小
+ (UIImage*)circleImage:(UIImage*)image withParam:(CGFloat)inset;
@end
