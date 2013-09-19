//
//  ListViewController.m
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/15/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import "ListViewController.h"
#import "TruckDetailViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setFoodTrucks:(NSMutableArray*)fts{
    foodTrucks = fts;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [foodTrucks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [[foodTrucks objectAtIndex:[indexPath row]] name];
    // Configure the cell...
    
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //truckList.delegate = self;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selected = [indexPath row];
    
    TruckDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TruckDetailViewController"];
    [vc setTitle:[[foodTrucks objectAtIndex:selected] name]];
    [vc setFoodTruck:[foodTrucks objectAtIndex:selected]];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
