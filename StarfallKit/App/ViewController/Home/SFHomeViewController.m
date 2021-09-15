//
//  SFHomeViewController.m
//  StarfallKit
//
//  Created by An Binh on 12/25/18.
//  Copyright © 2018 An Binh. All rights reserved.
//

#import "SFHomeViewController.h"

@interface SFHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIColor *contentColor;
@property (strong, nonatomic) NSArray *listItem;

@end

@implementation SFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listItem = @[@"Row Title 1", @"Row Title 2", @"Row Title 3"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"SFHomeViewCell";
    NSString *object = [self.listItem objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = object;
    cell.textLabel.textColor = [UIColor blueColor];
    cell.imageView.image = [UIImage imageNamed:@"panda"];
    cell.imageView.layer.cornerRadius = 8;
    cell.imageView.layer.masksToBounds = true;
    cell.imageView.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

@end
