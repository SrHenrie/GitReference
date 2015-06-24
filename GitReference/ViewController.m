//
//  ViewController.m
//  GitReference
//
//  Created by Sarah Henrie on 6/23/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic,strong)UIScrollView *propertyScrollView;
@property (nonatomic, strong)UILabel *propertyTitleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 self.propertyScrollView = [UIScrollView new];
    self.propertyScrollView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.propertyScrollView];
    self.propertyScrollView.alwaysBounceVertical = YES;
   
    self.propertyTitleLabel = [UILabel new];
    self.propertyTitleLabel.frame = CGRectMake(15, 20, self.view.frame.size.width -30, 40);
    self.propertyTitleLabel.text = @"GitReference";
//    self.propertyTitleLabel.layer.borderColor = (__bridge CGColorRef)([UIColor greenColor]);
//    self.propertyTitleLabel.layer.borderWidth = 3.0;
    [self.propertyScrollView addSubview:self.propertyTitleLabel];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
