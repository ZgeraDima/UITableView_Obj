//
//  ViewController.m
//  DZ 68 UITableVievTon
//
//  Created by mac on 27.03.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.tableview.contentInset = inset;
    self.tableview.scrollIndicatorInsets = inset;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    NSLog(@"numberOfSectionsInTableView");
    
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"numberOfRowsInSection %ld", (long)section);
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellForRowAtIndexPath: {%ld,%ld}", (long)indexPath.section, (long)indexPath.row);
    
    static NSString* indentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        
        NSLog(@"cell created");
    }
    else
    {
        NSLog(@"cell reused");
    }
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    
    UIFont* font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    
    
    return cell;
    
}





@end
