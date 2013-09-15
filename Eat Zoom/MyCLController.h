#import <CoreLocation/CoreLocation.h>

@protocol MyCLControllerDelegate <NSObject>
@required
- (CLLocationCoordinate2D)locationUpdate:(CLLocation *)location; 
@end

@interface MyCLController : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	__unsafe_unretained id delegate;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, assign) id <MyCLControllerDelegate> delegate;

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation;


@end