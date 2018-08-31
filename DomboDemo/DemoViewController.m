//
//  DemoViewController.m
//  DomboDemo
//
//  Created by 尹东博 on 2018/8/22.
//  Copyright © 2018年 尹东博. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str = @"pp是猪";
    NSLog(@"str1 == %p", str);
    
    [self ppIsPig];
}

- (void)ppIsPig {
    NSString *str = @"pp是猪";
    NSLog(@"str2 == %p", str);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
