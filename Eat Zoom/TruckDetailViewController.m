//
//  TruckDetailViewController.m
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/14/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import "TruckDetailViewController.h"
#import "FoodTruck.h"

@interface TruckDetailViewController ()

@end

@implementation TruckDetailViewController

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
	privateEmail.text = [foodTruck privateEmail];
    phone.text = [foodTruck phone];
    icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[foodTruck icon]]]];

    website.text = [foodTruck website];
    twitter.text = [foodTruck twitter];
    facebook.text = [foodTruck facebook];
    cuisineType.text = [foodTruck cuisineType];
    cost.text = [foodTruck cost];
    description.text = [foodTruck description];
}

-(void)setFoodTruck:(FoodTruck*)ft{
    foodTruck = ft;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
