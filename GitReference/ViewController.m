//
//  ViewController.m
//  GitReference
//
//  Created by Sarah Henrie on 6/23/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    scrollView.alwaysBounceVertical = YES;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width -15, 40)];
    titleLabel.text = @"GitReference";
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
