#import "FoodTruck.h"

@implementation FoodTruck
@synthesize name = _name;
@synthesize description=_description;
@synthesize icon=_icon;
@synthesize privateEmail=_privateEmail;
@synthesize phone=_phone;
@synthesize website=_website;
@synthesize twitter=_twitter;
@synthesize facebook=_facebook;
@synthesize cuisineType=_cuisineType;
@synthesize cost=_cost;
@synthesize coordinate = _coordinate;

- (id)initWithName:(NSString*)name description:(NSString*)description icon:(NSString*)icon privateEmail:(NSString*)privateEmail phone:(NSString*)phone website:(NSString*)website twitter:(NSString*)twitter facebook:(NSString*)facebook cuisineType:(NSString*)cuisineType cost:(NSString*)cost coordinate:(CLLocationCoordinate2D)coordinate{
    if ((self = [super init])) {
        _name = [name copy];
        _description = [description copy];
        _icon = [icon copy];
        _privateEmail = [privateEmail copy];
        _phone = [phone copy];
        _website = [website copy];
        _twitter = [twitter copy];
        _facebook = [facebook copy];
        _cuisineType = [cuisineType copy];
        _cost = [cost copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    if ([_name isKindOfClass:[NSNull class]]) 
        return @"Unknown name";
    else
        return _name;
}

- (NSString *)subtitle {
    return _cost;
}



@end