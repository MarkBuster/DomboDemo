//
//  ViewController.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/8/21.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "DemoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    size_t size = class_getInstanceSize([NSArray class]);
    NSLog(@"size == %zu", size);
    
//    NSString *str = @"pp是猪";
//    NSLog(@"str1 == %p", str);
//
//    [self ppIsPig];
    
//    NSObject *obj;
    
    NSObject *obj = [NSObject new];
//    [obj setValue:@5566 forKeyPath:@"person.name"];
//    [obj valueForKeyPath:@"person.name"];
//    obj.accessg
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(33,268,309,132);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
//    gl.frame = CGRectMake(33,268,309,132);
    gl.frame = view.bounds;
    gl.startPoint = CGPointMake(0, 0.5);
    gl.endPoint = CGPointMake(1, 0.5);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:168/255.0 green:134/255.0 blue:255/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:122/255.0 green:133/255.0 blue:255/255.0 alpha:1].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    
    view.layer.cornerRadius = 15;
    view.layer.masksToBounds = YES;
    [view.layer addSublayer:gl];
}

- (void)ppIsPig {
//    NSString *str = @"pp是猪";
//    NSLog(@"str2 == %p", str);
}

- (IBAction)toDemoVC:(UIButton *)sender {
//    NSString *str = @"pp是猪";
//    NSLog(@"str2 == %p", str);
//
    DemoViewController *demoVC = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:demoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
