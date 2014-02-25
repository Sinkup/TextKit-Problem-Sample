//
//  CHThirdViewController.m
//  TextKit
//
//  Created by Chenhao on 14-2-21.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import "CHThirdViewController.h"

@interface CHThirdViewController ()

@end

@implementation CHThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil]];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    //TextContainer1
    NSTextContainer *textContainer1 = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer1];
    
    CGRect frame = CGRectMake(10, 30, 145, 480);
    UITextView *textView1 = [[UITextView alloc] initWithFrame:frame textContainer:textContainer1];
    textView1.editable = NO;
    textView1.scrollEnabled = NO;//
    textView1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:textView1];
    
    
    //TextContainer2
    NSTextContainer *textContainer2 = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer2];
    
    frame.origin.x += 155;
    UITextView *textView2 = [[UITextView alloc] initWithFrame:frame textContainer:textContainer2];
    textView2.editable = NO;
    textView2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:textView2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
