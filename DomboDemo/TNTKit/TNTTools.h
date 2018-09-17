//
//  TNTTools.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/9/11.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TNTTools : NSObject

+ (NSString *)currentTimeStr;//!< 当前时间戳
+ (NSString *)getQuanPinChineseChar:(NSString *)letterStr; //!< 拼音解析
+ (UIImage *)createImageWithColor:(UIColor*)color; //!< 颜色生成Image
+ (NSInteger)getRandomNum:(NSInteger)idCount;//!< 获取随机数 count 为随机数的位数
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString; //!< json 转 字典
+ (void)playIndividualBells:(NSString *)bellFileName; //!< 播放音频文件
@end
