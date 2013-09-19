//
//  MapViewController.h
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/14/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyCLController.h"
#import "FoodTruck.h"

@interface MapViewController : UIViewController <MyCLControllerDelegate,MKMapViewDelegate>{
    FoodTruck *foodTruck;
    IBOutlet MKMapView *mapView;
    MyCLController *locationController;
    NSMutableArray *foodTrucks;
}

- (CLLocationCoordinate2D)locationUpdate:(CLLocation *)location;

@end
