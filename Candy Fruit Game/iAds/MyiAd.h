//
//  iAd.h
//  Cocos2d_3_iAd
//
//  Created by Gururaj T on 18/02/14.
//  Copyright (c) 2014 Gururaj T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import "iAd/ADBannerView.h"
//#import <Chartboost/Chartboost.h>
//@import GoogleMobileAds;
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface MyiAd : NSObject<ADBannerViewDelegate,GADBannerViewDelegate>
{
    ADBannerView *_adBannerView;
    bool _adBannerViewIsVisible;
    UIView *_contentView;
    bool mIsLoaded;
}
@property (nonatomic) bool adBannerViewIsVisible;
@property(nonatomic, strong) GADInterstitial *interstitial;
//@property(nonatomic, strong) GADBannerView *bannerView;

-(void)showBannerView;
-(void)RemoveiAd ;
- (void)createAdBannerView ;
-(void)hideBannerView;

@end
