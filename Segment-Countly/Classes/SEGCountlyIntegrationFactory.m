#import "SEGCountlyIntegrationFactory.h"
#import "SEGCountlyIntegration.h"
#import <Countly/Countly.h>


@implementation SEGCountlyIntegrationFactory

+ (instancetype)instance
{
    static dispatch_once_t once;
    static SEGCountlyIntegrationFactory *sharedInstance;
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
    NSString *appKey = [settings objectForKey:@"appKey"];
    NSString *serverUrl = [settings objectForKey:@"serverUrl"];

    return [[SEGCountlyIntegration alloc] initWithCountly:[Countly sharedInstance] appKey:appKey serverUrl:serverUrl];
}

- (NSString *)key
{
    return @"Countly";
}

@end
