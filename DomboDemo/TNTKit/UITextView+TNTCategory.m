//
//  UITextView+TNTCategory.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "UITextView+TNTCategory.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import "TNTCommonMacro.h"

static NSString *kLimitTextViewTextLengthKey = @"kLimitTextViewTextLengthKey";
static NSString *kLimitTextViewTextBlockKey = @"kLimitTextViewTextBlockKey";



@implementation UITextView (TNTCategory)

- (void)limitTextViewTextLength:(NSInteger)length textViewChanged:(UITextViewLimitTextLengthBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextViewTextLengthKey), [NSNumber numberWithInteger:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextViewTextBlockKey),block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
}

-(void)textViewChanged:(NSNotification *)obj {
    NSString *toBeString = self.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; // 键盘输入模式
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextViewTextLengthKey));
    int length = [lengthNumber intValue];
    
    UITextViewLimitTextLengthBlock block = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextViewTextBlockKey));
    
    if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > length) {
                self.text = [toBeString substringToIndex:length];
            }
        } else { //有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
    } else { //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > length) {
            NSRange range = [toBeString rangeOfComposedCharacterSequenceAtIndex:length];
            self.text = [toBeString substringToIndex:range.location];
        }
    }
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        if (self.text.length > length) {
            NSRange range = [toBeString rangeOfComposedCharacterSequenceAtIndex:length];
            self.text = [toBeString substringToIndex:range.location];
        }
    }
    NSInteger textCounter = length - self.text.length;
    if  (block) {
        block(textCounter);
    }
}
@end
