//
//  SFHomeViewController.m
//  StarfallKit
//
//  Created by An Binh on 12/25/18.
//  Copyright © 2018 An Binh. All rights reserved.
//

#import "SFHomeViewController.h"

@interface SFHomeViewController ()

@property (strong, nonatomic) UIColor *contentColor;

@end

@implementation SFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
//    [self.contentView setBackgroundColor:self.contentColor];
}

- (void)setBackground:(UIColor *)color {
    self.contentColor = color;
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
