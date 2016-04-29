#import "SEGCountlyIntegrationFactory.h"
#import "SEGCountlyIntegration.h"
#import <Countly/Countly.h>


@implementation SEGCountlyIntegrationFactory

+ (instancetype)instance
{
    static dispatch_once_t once;
    static SEGCountlyIntegration *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics
{
    return [[SEGCountlyIntegration alloc] initWithSettings:settings countly:[Countly sharedInstance]];
}

- (NSString *)key
{
    return @"Countly";
}

@end
