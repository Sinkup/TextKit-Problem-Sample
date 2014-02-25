//
//  CHFirstViewController.m
//  TextKit
//
//  Created by Chenhao on 14-2-21.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import "CHFirstViewController.h"

@interface CHFirstViewController ()

@property (strong, nonatomic) UITextView *textView;

@end

@implementation CHFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil]];
    
    [textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 20)];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer];
    
    CGRect frame = CGRectMake(10, 30, 300, 480);
    self.textView = [[UITextView alloc] initWithFrame:frame textContainer:textContainer];
    //self.textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    self.textView.editable = NO;
    self.textView.backgroundColor = [UIColor colorWithRed:255/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    [self.view addSubview:self.textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
