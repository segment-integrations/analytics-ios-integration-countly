#import <Foundation/Foundation.h>
#import <Countly/Countly.h>
#if defined(__has_include) && __has_include(<Analytics/SEGAnalytics.h>)
#import <Analytics/SEGIntegration.h>
#else
#import <Segment/SEGIntegration.h>
#endif

@interface SEGCountlyIntegration : NSObject <SEGIntegration>

@property (nonatomic, strong) Countly *countly;

- (instancetype)initWithCountly:(Countly *)countly appKey:(NSString *)appKey serverUrl:(NSString *)serverUrl;

@end
