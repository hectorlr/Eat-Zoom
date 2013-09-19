//
//  MapViewController.m
//  Eat Zoom
//
//  Created by Hector Rodriguez on 9/14/13.
//  Copyright (c) 2013 Hector Rodriguez. All rights reserved.
//

#import "MapViewController.h"
#import "FoodTruck.h"
#import "TruckDetailViewController.h"
#import "ListViewController.h"

@interface MapViewController ()
@end

@implementation MapViewController

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
    locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	[locationController.locationManager startUpdatingLocation];
    
    //mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeStandard;
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    CLLocationCoordinate2D coord = [self locationUpdate:locationController.locationManager.location];
    MKCoordinateSpan span = {.latitudeDelta =  0.01, .longitudeDelta =  0.01};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    foodTrucks = [[NSMutableArray alloc] initWithCapacity:5];
    [self loadTrucks:self];
    [self.view addSubview:mapView];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CLLocationCoordinate2D)locationUpdate:(CLLocation *)location {
	return [location coordinate];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"FoodTruck";
    if ([annotation isKindOfClass:[FoodTruck class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        UIButton * disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView = disclosureButton;
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image=[UIImage imageNamed:@"FoodTruckIcon.png"];//here we use a nice image instead of the default pins
        
       /* MKMapRect visibleMapRect = mapView.visibleMapRect;
        NSSet *visibleAnnotations = [mapView annotationsInMapRect:visibleMapRect];
        BOOL annotationIsVisible = [visibleAnnotations containsObject:annotation];
        if (annotationIsVisible) {*/
            [foodTrucks addObject:annotation];
       // }
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    foodTruck = view.annotation;
    [self performSegueWithIdentifier:@"TruckSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"TruckSegue"])
    {
        TruckDetailViewController *vc = [segue destinationViewController];
        [vc setTitle:[foodTruck name]];
        [vc setFoodTruck:foodTruck];
    }
    
    if ([[segue identifier] isEqualToString:@"ListSegue"])
    {
        ListViewController *vc = [segue destinationViewController];
        [vc setFoodTrucks:foodTrucks];
    }
}

- (void)loadTrucks:(id)sender {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"truckJson" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&myError];
    NSArray *arr;
    arr = [res allKeys];
    for(NSString* info in arr){
        NSArray *setHostNames = [res objectForKey:info];
        for(NSDictionary *item in setHostNames) {
            NSNumber *latitude = [item objectForKey:@"LAT"];
            NSNumber *longitude = [item objectForKey:@"LONG"];
            NSString *name = [item objectForKey:@"Name"];
            NSString *description = [item objectForKey:@"Description"];;
            NSString *icon = [item objectForKey:@"Icon"];
            NSString *privateEmail = [item objectForKey:@"Private Email"];
            NSString *phone = [item objectForKey:@"Phone"];
            NSString *website = [item objectForKey:@"Website"];
            NSString *twitter = [item objectForKey:@"Twitter"];
            NSString *facebook = [item objectForKey:@"Facebook"];
            NSString *cuisineType = [item objectForKey:@"Cuisine Type"];
            NSString *cost = [item objectForKey:@"Cost"];
            
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = latitude.doubleValue;
            coordinate.longitude = longitude.doubleValue;
            FoodTruck *foodT = [[FoodTruck alloc] initWithName:name description:description icon:icon privateEmail:privateEmail phone:phone website:website twitter:twitter facebook:facebook cuisineType:cuisineType cost:cost coordinate:coordinate] ;
            
            [mapView addAnnotation:foodT];
        }
    }
}


@end
