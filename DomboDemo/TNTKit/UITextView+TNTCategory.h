//
//  UITextView+TNTCategory.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UITextViewLimitTextLengthBlock)(NSInteger);

@interface UITextView (TNTCategory)

- (void)limitTextViewTextLength:(NSInteger)length
                textViewChanged:(UITextViewLimitTextLengthBlock)block; //!< 限制字数输入，lent为限制的字数长度最大值
@end
