#import <Foundation/Foundation.h>
#import <Countly/Countly.h>
#import <Analytics/SEGIntegration.h>


@interface SEGCountlyIntegration : NSObject <SEGIntegration>

@property (nonatomic, strong) Countly *countly;

- (instancetype)initWithCountly:(Countly *)countly appKey:(NSString *)appKey serverUrl:(NSString *)serverUrl;

@end
