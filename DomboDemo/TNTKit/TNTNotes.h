//
//  TNTNotes.h
//  DomboDemo
//
//  Created by 尹东博 on 2018/8/21.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#ifndef TNTNotes_h
#define TNTNotes_h


//
/*
 
 UIView *view;
 view.opaque = YES;
 
 离屏渲染触发条件
 光栅化   view.layer.shouldRasterize = YES;
 遮罩     view.layer.mask
 圆角     view.layer.masksToBounds = YES;  view.layer.cornerRadius  > 0
 同时满足masksToBounds = YES 和 cornerRadius  > 0 才会触发离屏渲染
 【如果真要使用圆角，则使用CoreGraphics绘制裁剪圆角，或者美工切图】
 阴影     view.layer.shadowOffset
 如果设置了 view.layer.shadowPath  就不会触发离屏渲染
 */

//    省电系列
//    dispatch_io_t  大量读写用这个，基于GCD的异步操作文件I/O的API，系统会优化磁盘访问
//    NSMutableURLRequest 中的  NSCache 进行 如果多次请求的结果是相同的，尽量使用缓存
//    网络不可用，不要进行网络请求

// 冷启动时间监测
// RUN -> Arguments -> Environment Variables
//    DYLD_PRINT_STATISTICS 1
//    DYLD_PRINT_STATISTICS_DETAILS

/*
 监测无引用资源：LSUnusedResources
 监测无调用代码：自己写 LLVVM 插件
 监测项目类文件的磁盘大小：LinkMap
 */

#endif /* TNTNotes_h */
