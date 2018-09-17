//
//  UITextField+TNTCategory.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/17.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "UITextField+TNTCategory.h"
#import <objc/objc.h>
#import <objc/runtime.h>

static NSString *kLimitTextFieldTextLengthKey = @"kLimitTextFieldTextLengthKey";
static NSString *kLimitTextFieldTextBlockKey = @"kLimitTextFieldTextBlockKey";

@implementation UITextField (TNTCategory)


- (void)limitTextFieldTextLength:(int)length
                textFieldChanged:(UITextFieldLimitTextLengthBlock)block {
    
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextFieldTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextFieldTextBlockKey),block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldChanged:(id)sender {
    NSString *toBeString = self.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; // 键盘输入模式
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextFieldTextLengthKey));
    int length = [lengthNumber intValue];
    
    UITextFieldLimitTextLengthBlock block = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextFieldTextBlockKey));
    
    if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > length) {
                NSRange range = [toBeString rangeOfComposedCharacterSequenceAtIndex:length];
                self.text = [toBeString substringToIndex:range.location];
            }
        } else { //有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
    } else { //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > length) {
            NSRange range = [toBeString rangeOfComposedCharacterSequenceAtIndex:length];
            self.text = [toBeString substringToIndex:range.location];
        }
    }
    
    NSInteger textCounter = length - self.text.length;
    if  (block) {
        block(textCounter);
    }
}


- (NSRange) selectedRange {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void) setSelectedRange:(NSRange) range {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}
@end
