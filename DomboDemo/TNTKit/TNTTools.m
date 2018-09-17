//
//  TNTTools.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/11.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "TNTTools.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@implementation TNTTools

+ (NSString *)currentTimeStr {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

/*
 功能:播放自定义铃声
 参数:铃声文件名
 说明：如果找不到此文件，则播放系统默认的提示音 AudioServicesPlaySystemSounde(1004)
 */
+ (void)playIndividualBells:(NSString *)bellFileName {
    NSString *path = [NSString stringWithFormat:@"%@/%@",
                      [[NSBundle mainBundle] resourcePath], bellFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        AudioServicesPlaySystemSound(1004);
        return;
    }
    NSURL* filePath = [NSURL fileURLWithPath:path isDirectory: NO];
    
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

/*
 功能:获取汉字字符的全拼音
 参数:汉字字符
 说明:如果传入的不是汉字，则一律返回“＃”
 */
+ (NSString *)getQuanPinChineseChar:(NSString *)letterStr{
    if (letterStr&&![@"" isEqualToString:letterStr]) {
        NSMutableString *ms = [letterStr mutableCopy];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"Pingying1: %@", ms); // wǒ shì zhōng guó rén
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"Pingying2: %@", ms); // wo shi zhong guo ren
            return [ms stringByReplacingOccurrencesOfString:@" " withString:@""].lowercaseString;
            //object.room_groupByChar=[ms substringToIndex:1].lowercaseString;
        }
        return @"{";
    }
    return letterStr;
}

/*
 功能:是否是a－z
 参数:传入字符
 */
+ (NSString *)isa2zLetter:(NSString *)letterStr{
    NSString *regStr=@"[a-zA-Z]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regStr];
    if([pred evaluateWithObject:letterStr]){
        return letterStr.lowercaseString;
    }
    return @"{";
}

/*
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments  error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSInteger)getRandomNum:(NSInteger)idCount{
    NSArray *array=[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    NSMutableString *messageID=[NSMutableString stringWithString:@""];
    for (int i=0; i<idCount; i++) {
        int value = arc4random()%[array count];
        [messageID appendString:[array objectAtIndex:value]];
    }
    return [messageID integerValue];
}


//判断当前的网络是是wifi还是手机流量
//+(NetworkStatus)GetCurrntNet
//{
//    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    return [r currentReachabilityStatus];
//}

+ (UIImage *)createImageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage* theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
