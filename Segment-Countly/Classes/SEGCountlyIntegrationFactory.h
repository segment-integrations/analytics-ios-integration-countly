#import <Foundation/Foundation.h>
#import <Analytics/SEGIntegrationFactory.h>


@interface SEGCountlyIntegrationFactory : NSObject <SEGIntegrationFactory>

+ (instancetype)instance;

@end
