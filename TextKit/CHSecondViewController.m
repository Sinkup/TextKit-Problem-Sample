//
//  CHSecondViewController.m
//  TextKit
//
//  Created by Chenhao on 14-2-21.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import "CHSecondViewController.h"

@interface CHSecondViewController () <NSLayoutManagerDelegate>

@property (strong, nonatomic) NSLayoutManager *layoutManager1;
@property (strong, nonatomic) NSLayoutManager *layoutManager2;

@end

@implementation CHSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil]];
    
    //LayoutManager1
    CGRect frame = CGRectMake(10, 30, 300, 235);
    self.layoutManager1 = [[NSLayoutManager alloc] init];
    self.layoutManager1.delegate = self;
    [textStorage addLayoutManager:self.layoutManager1];
    
    NSTextContainer *textContainer1 = [[NSTextContainer alloc] init];
    [self.layoutManager1 addTextContainer:textContainer1];
    
    UITextView *textView1 = [[UITextView alloc] initWithFrame:frame textContainer:textContainer1];
    textView1.editable = NO;
    textView1.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:textView1];
    
    
    //LayoutManager2
    frame.origin.y += 245;
    self.layoutManager2 = [[NSLayoutManager alloc] init];
    self.layoutManager2.delegate = self;
    [textStorage addLayoutManager:self.layoutManager2];
    
    NSTextContainer *textContainer2 = [[NSTextContainer alloc] init];
    [self.layoutManager2 addTextContainer:textContainer2];
    
    UITextView *textView2 = [[UITextView alloc] initWithFrame:frame textContainer:textContainer2];
    textView2.editable = NO;
    textView2.backgroundColor = [UIColor colorWithRed:240/255.0 green:255/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:textView2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    if (layoutManager == self.layoutManager1) {
        return 0;
    } else {
        return 5;
    }
}

@end
