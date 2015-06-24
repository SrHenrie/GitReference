//
//  ViewController.m
//  GitReference
//
//  Created by Sarah Henrie on 6/23/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

// static variables are great for creating values that will be used over and over again and also for dictionary keys so you dont accidently miss spell them.
static CGFloat heightForLabel = 20;
static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";


@interface ViewController ()
//
@property (nonatomic,strong)UIScrollView *propertyScrollView;
@property (nonatomic, strong)UILabel *propertyTitleLabel;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //self means calling the property within its own class and alloc and initing it.
    self.propertyScrollView = [UIScrollView new];
    self.propertyScrollView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    self.propertyScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:self.propertyScrollView];
   
    self.propertyTitleLabel = [UILabel new];
    self.propertyTitleLabel.frame = CGRectMake(15, 20, self.view.frame.size.width -30, heightForLabel);
    self.propertyTitleLabel.text = @"GitReference";
    
   //to make border
    self.propertyTitleLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.propertyTitleLabel.layer.borderWidth = 1.0;
    
   //puts the text in center in the label
    self.propertyTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    //to make border with rounded edges instead of square edges.
    self.propertyTitleLabel.layer.cornerRadius = 5.0;
    
    [self.propertyScrollView addSubview:self.propertyTitleLabel];
    
    //This gives a top margin of 20 so the view wont' be hidden behind the status bar
    CGFloat topMargin = 20;
    //This give us a starting point for our first label in the for loop
    CGFloat top = topMargin + heightForLabel + margin * 2;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    //for loop that itterates through the NSArray called gitCommands
    for (NSDictionary *gitCommand in [self gitCommands]){
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForLabel)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = command;
        [self.propertyScrollView addSubview:gitCommand];
      
        // takes the y axis value of the previous label in the for loop and adds the height of the label to give you a new y axis value of the label being created.
        top+= (heightForLabel + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *gitReference = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForReference)];
        gitReference.numberOfLines= 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        [self.propertyScrollView addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
        
    }
    self.propertyScrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
