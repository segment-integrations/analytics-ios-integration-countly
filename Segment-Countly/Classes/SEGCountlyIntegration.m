#import "SEGCountlyIntegration.h"
#import <Analytics/SEGAnalyticsUtils.h>


@implementation SEGCountlyIntegration

- (instancetype)initWithCountly:(Countly *)countly appKey:(NSString *)appKey serverUrl:(NSString *)serverUrl
{
    if (self = [super init]) {
        _countly = countly;

        // Countly's SDK will silently fail to send data if it's not initialized on the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            CountlyConfig *config = [[CountlyConfig alloc] init];
            config.appKey = appKey;
            config.host = serverUrl;
            [self.countly startWithConfig:config];
            SEGLog(@"[[Countly sharedInstance] startWithConfig:%@];", config);
        });
    }
    return self;
}

- (void)track:(SEGTrackPayload *)payload
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // Countly doesn't accept nested properties, so remove them (with a warning).
        NSDictionary *properties = [self ensureNotNested:payload.properties];

        NSNumber *revenue = [SEGCountlyIntegration extractRevenue:properties withKey:@"revenue"];
        if (revenue) {
            [self.countly recordEvent:payload.event segmentation:properties count:1 sum:revenue.longValue];
            SEGLog(@"[[Countly sharedInstance] recordEvent:%@ segmentation:%@ count:1 sum:@count];", payload.event, properties, revenue.longValue);
        } else {
            [self.countly recordEvent:payload.event segmentation:properties count:1];
            SEGLog(@"[[Countly sharedInstance] recordEvent:%@ segmentation:%@ count:1];", payload.event, properties);
        }
    });
}


+ (NSNumber *)extractRevenue:(NSDictionary *)dictionary withKey:(NSString *)revenueKey
{
    id revenueProperty = nil;

    for (NSString *key in dictionary.allKeys) {
        if ([key caseInsensitiveCompare:revenueKey] == NSOrderedSame) {
            revenueProperty = dictionary[key];
            break;
        }
    }

    if (revenueProperty) {
        if ([revenueProperty isKindOfClass:[NSString class]]) {
            // Format the revenue.
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
            return [formatter numberFromString:revenueProperty];
        } else if ([revenueProperty isKindOfClass:[NSNumber class]]) {
            return revenueProperty;
        }
    }
    return nil;
}

- (NSDictionary *)ensureNotNested:(NSDictionary *)dictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dictionary];

    // Iterate over the properties and remove nested dictionaries and arrays.
    for (id key in dictionary) {
        id value = [dict objectForKey:key];
        if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]) {
            SEGLog(@"WARNING: Countly does not support nested properties. Removing nested property %@ for Countly.", key);
            [dict removeObjectForKey:key];
        }
    }

    return dict;
}

@end
