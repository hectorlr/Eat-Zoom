#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface FoodTruck : NSObject <MKAnnotation> {
    NSString *_name;
    NSString *_description;
    NSString *_icon;
    NSString *_privateEmail;
    NSString *_phone;
    NSString *_website;
    NSString *_twitter;
    NSString *_facebook;
    NSString *_cuisineType;
    NSString *_cost;
    CLLocationCoordinate2D _coordinate;
    
}
@property (copy) NSString *name;
@property (copy) NSString *description;
@property (copy) NSString *icon;
@property (copy) NSString *privateEmail;
@property (copy) NSString *phone;
@property (copy) NSString *website;
@property (copy) NSString *twitter;
@property (copy) NSString *facebook;
@property (copy) NSString *cuisineType;
@property (copy) NSString *cost;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name description:(NSString*)description icon:(NSString*)icon privateEmail:(NSString*)privateEmail phone:(NSString*)phone website:(NSString*)website twitter:(NSString*)twitter facebook:(NSString*)facebook cuisineType:(NSString*)cuisineType cost:(NSString*)cost coordinate:(CLLocationCoordinate2D)coordinate;

@end
