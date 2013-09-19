//
//  ListViewController.h
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/15/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *foodTrucks;
    NSUInteger selected;
}


-(void)setFoodTrucks:(NSMutableArray *) fts;
@end
