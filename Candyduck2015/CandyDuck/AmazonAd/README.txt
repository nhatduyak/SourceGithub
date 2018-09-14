iOS Amazon Mobile SDK
Version 2.2.10
2015 July 31

This release supports iPhone, iPod and iPad devices on iOS 6.0 and above. Please 
refer to the Amazon Mobile Ad Development Guide located in the documentation directory.

Release notes
- AmazonAd resource bundle is no longer used and is removed from the SDK.
- SDK now requires app to link to SystemConfiguration.framework, CoreTelephony.framework and MediaPlayer.framework. Refer to the "Quickstart Guide" section in the Amazon Mobile Ad Development Guide for details.

KNOWN ISSUES
* During integration and testing of the Amazon Mobile Ads SDK, you should set the 
  testRequest option to true. This indicates that the request is for testing. Test 
  requests will not show up in your metrics. Test traffic that doesn’t include 
  this flag can result in blocked requests, fraud investigation, and potential 
  account termination. Each loadAd call requires an instance of an AmazonAdOptions 
  class. Set the testRequest property to YES to enable test requests. For example:

    AmazonAdOptions *options = [AmazonAdOptions options];
    adOptions.isTestRequest = YES;
   [amazonAdView loadAd:options];

