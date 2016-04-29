#import <Foundation/Foundation.h>
#import <Countly/Countly.h>
#import <Analytics/SEGIntegration.h>


@interface SEGCountlyIntegration : NSObject <SEGIntegration>

@property (nonatomic, readonly) NSDictionary *settings;
@property (nonatomic, strong) Countly *countly;

- (instancetype)initWithSettings:(NSDictionary *)settings countly:(Countly *)countly;

@end
