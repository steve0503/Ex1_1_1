//
//  ViewController.m
//  Ex1_1_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"

#import "Model.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *productNameField;


@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

-(IBAction)addNewProduct:(id)sender{
    
    Model *model = [Model sharedModel];
    
    NSString *productName = self.productNameField.text;
    
    [model addProduct:productName];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([model numberOfProduct]-1) inSection:0];
    
    NSArray *newRow = [NSArray arrayWithObject:indexPath];
    
    [self.table insertRowsAtIndexPaths:newRow withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.productNameField setText:@""];
    
    
}

-(void)tableView:(UITableView *)tableview commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[Model sharedModel] removeProductAt:indexPath.row];
    
    NSArray *rowForDelete = [NSArray arrayWithObject:indexPath];
    
    [tableview deleteRowsAtIndexPaths:rowForDelete withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[Model sharedModel] numberOfProduct];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    
    Model *model = [Model sharedModel];
    
    cell.textLabel.text = [model productAt:indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
