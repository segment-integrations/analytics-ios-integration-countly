
void processMainThread()
{
    waitUntil(^(DoneCallback done) {
        dispatch_async(dispatch_get_main_queue(), ^{
            done();
        });
    });
}

SpecBegin(InitialSpecs);

describe(@"factory", ^{
    it(@"creates integration with settings", ^{
        SEGCountlyIntegration *integration = [[SEGCountlyIntegrationFactory instance] createWithSettings:@{
            @"appKey" : @"foo",
            @"serverUrl" : @"bar"
        } forAnalytics:nil];

        processMainThread();

        expect(integration.countly).notTo.equal(nil);
    });
});

describe(@"integration", ^{
    __block Countly *mockCountly;
    __block SEGCountlyIntegration *integration;

    beforeEach(^{
        mockCountly = mock([Countly class]);
        integration = [[SEGCountlyIntegration alloc] initWithCountly:mockCountly appKey:@"foo" serverUrl:@"bar"];
    });

    it(@"track", ^{
        SEGTrackPayload *payload = [[SEGTrackPayload alloc] initWithEvent:@"foo" properties:@{} context:@{} integrations:@{}];

        [integration track:payload];

        processMainThread();

        [verify(mockCountly) recordEvent:@"foo" segmentation:@{} count:1];
    });

    it(@"track with revenue", ^{
        SEGTrackPayload *payload = [[SEGTrackPayload alloc] initWithEvent:@"foo" properties:@{
            @"revenue" : @20
        } context:@{}
            integrations:@{}];

        [integration track:payload];

        processMainThread();


        [verify(mockCountly) recordEvent:@"foo" segmentation:@{
            @"revenue" : @20
        } count:1 sum:20];
    });

    it(@"screen", ^{
        SEGScreenPayload *payload = [[SEGScreenPayload alloc] initWithName:@"foo" properties:@{} context:@{} integrations:@{}];

        [integration screen:payload];

        processMainThread();

        [verify(mockCountly) recordEvent:@"Viewed foo Screen" segmentation:@{} count:1];
    });

});

SpecEnd
