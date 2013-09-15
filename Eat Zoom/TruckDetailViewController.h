//
//  TruckDetailViewController.h
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/14/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodTruck.h"

@interface TruckDetailViewController : UIViewController{
    FoodTruck *foodTruck;
    __weak IBOutlet UIImageView *icon;
    __weak IBOutlet UILabel *privateEmail;
    __weak IBOutlet UILabel *phone;
    __weak IBOutlet UILabel *website;
    __weak IBOutlet UILabel *twitter;
    __weak IBOutlet UILabel *facebook;
    __weak IBOutlet UILabel *cuisineType;
    __weak IBOutlet UILabel *cost;
    __weak IBOutlet UITextView *description;
        
    }
-(void)setFoodTruck:(FoodTruck *) ft;
@end
