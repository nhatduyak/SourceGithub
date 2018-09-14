//
//  AppDelegate.h
//  CandyDuck
//
//  Created by Amornthep on 2/8/2557 BE.
//  Copyright (c) 2557 Amornthep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
//#import "GADBannerView.h"
#import <Chartboost/Chartboost.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,ChartboostDelegate>{
    //GADBannerView *adBanner_;
    //GADBannerView *bannerView_;
}

@property (strong, nonatomic) UIWindow *window;

-(void)showAds;

@end
