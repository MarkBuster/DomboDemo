//
//  UITextField+TNTCategory.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UITextFieldLimitTextLengthBlock)(NSInteger);
@interface UITextField (TNTCategory)

- (void)limitTextFieldTextLength:(int)length
                textFieldChanged:(UITextFieldLimitTextLengthBlock)block; //!< 限制字数输入，lent为限制的字数长度最大值

- (NSRange)selectedRange;
- (void)setSelectedRange:(NSRange)range;

@end
