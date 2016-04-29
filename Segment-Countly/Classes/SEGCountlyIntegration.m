#import "SEGCountlyIntegration.h"


@implementation SEGCountlyIntegration

- (instancetype)initWithSettings:(NSDictionary *)settings countly:(Countly *)countly
{
    if (self = [super init]) {
        _settings = settings;
        _countly = countly;
    }
    return self;
}

@end
