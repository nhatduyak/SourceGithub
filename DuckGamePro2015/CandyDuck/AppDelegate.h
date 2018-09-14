//
//  AppDelegate.h
//  CandyDuck
//
//  Created by Amornthep on 2/8/2557 BE.
//  Copyright (c) 2557 Amornthep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <MillennialMedia/MMSDK.h>
#import <CoreLocation/CoreLocation.h>
//#import "GADBannerView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    //GADBannerView *adBanner_;
    //GADBannerView *bannerView_;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;
-(void)showAds;

@end
