//
//  JXViewController.m
//  JXVerticalLayout
//
//  Created by luqyluqe on 12/01/2015.
//  Copyright (c) 2015 luqyluqe. All rights reserved.
//

#import "JXViewController.h"
#import "JXVerticalLayout.h"

@interface JXViewController ()

@end

@implementation JXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    CGRect frame=self.view.bounds;
    frame.size.height=20;
    JXVerticalLayout* verticalLayout=[[JXVerticalLayout alloc] initWithFrame:frame];
    NSString* text=@"JXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayoutJXVerticalLayout";
    UILabel* label0=[[UILabel alloc] init];
    label0.font=[UIFont systemFontOfSize:15];
    label0.text=text;
    [verticalLayout appendLabel:label0 widthLimit:200 alignment:JXVerticalLayoutAlignmentLeft];
    [verticalLayout appendBlankLineWithHeight:20];
    UILabel* label1=[[UILabel alloc] init];
    label1.font=[UIFont systemFontOfSize:16];
    label1.text=text;
    [verticalLayout appendLabel:label1 widthLimit:250 alignment:JXVerticalLayoutAlignmentCenter];
    [verticalLayout appendBlankLineWithHeight:20];
    UILabel* label2=[[UILabel alloc] init];
    label2.font=[UIFont systemFontOfSize:14];
    label2.text=text;
    [verticalLayout appendLabel:label2 widthLimit:200 alignment:JXVerticalLayoutAlignmentRight];
    [verticalLayout appendBlankLineWithHeight:20];
    verticalLayout.view.backgroundColor=[UIColor blueColor];
    [self.view addSubview:verticalLayout.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
