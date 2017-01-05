# Segment-Countly

[![CI Status](http://img.shields.io/travis/segment-integrations/analytics-ios-integration-countly.svg?style=flat)](https://travis-ci.org/segment-integrations/analytics-ios-integration-countly)
[![Version](https://img.shields.io/cocoapods/v/Segment-Countly.svg?style=flat)](http://cocoapods.org/pods/Segment-Countly)
[![License](https://img.shields.io/cocoapods/l/Segment-Countly.svg?style=flat)](http://cocoapods.org/pods/Segment-Countly)

Countly integration for analytics-ios.

## Installation

To install the Segment-Countly integration, simply add this line to your [CocoaPods](http://cocoapods.org) `Podfile`:

```ruby
pod "Segment-Countly"
```

## Usage

After adding the dependency, you must register the integration with our SDK.  To do this, import the Countly integration in your `AppDelegate`:

```
#import <Segment-Countly/SEGCountlyIntegrationFactory.h>
```

And add the following lines:

```
NSString *const SEGMENT_WRITE_KEY = @" ... ";
SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:SEGMENT_WRITE_KEY];

[config use:[SEGCountlyIntegrationFactory instance]];

[SEGAnalytics setupWithConfiguration:config];

```

## License

```
WWWWWW||WWWWWW
 W W W||W W W
      ||
    ( OO )__________
     /  |           \
    /o o|    MIT     \
    \___/||_||__||_|| *
         || ||  || ||
        _||_|| _||_||
       (__|__|(__|__|

The MIT License (MIT)

Copyright (c) 2014 Segment, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
