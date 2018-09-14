//
//  iAd.m
//  Cocos2d_3_iAd
//
//  Created by Gururaj T on 18/02/14.
//  Copyright (c) 2014 Gururaj T. All rights reserved.
//

#import "MyiAd.h"
#import "AppDelegate.h"
#import <AdColony/AdColony.h>
#import "GameAriesCrush-Swift.h"
@implementation MyiAd

@synthesize adBannerViewIsVisible = _adBannerViewIsVisible;
//@synthesize adBannerView = _adBannerView;

-(id)init
{
    if(self=[super init])
    {
        //mIsLoaded = false;
        _adBannerViewIsVisible = false;
        [self createAdBannerView];
        
    }
    return self;
}

- (void)createAdBannerView
{
    AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));
    //[app.navController.view addSubview:_bannerView];
    MyAd *myad =[[MyAd alloc] initWithRoot:app.navController];
    [myad ViewDidload];
//    NEWMyiAd *iad=[[NEWMyiAd alloc] init];
//    [iad khoitao:app.navController];
//    [iad ViewDidload];
    [self ViewDidload];

    
}
-(void)showBannerView
{
    _adBannerViewIsVisible = true;
    AppController * myDelegate = (((AppController*) [UIApplication sharedApplication].delegate));
    [myDelegate.navController.view addSubview:_adBannerView];
    
    if (_adBannerView)
    {
        //CGSize s = [[CCDirector sharedDirector] winSize];
        
        CGRect frame = _adBannerView.frame;
        frame.origin.y = -(frame.size.height); //(IS_IPAD) ? -66.0f : -50.0f;
        frame.origin.x = 0.0f;
        
        _adBannerView.frame = frame;
        
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationCurveEaseOut
                         animations:^
         {
             
             CGRect frame = _adBannerView.frame;
             frame.origin.y = -(frame.size.height); //(IS_IPAD) ? -66.0f : -50.0f;
             frame.origin.x = 0.0f;
             
             _adBannerView.frame = frame;
         }
                         completion:^(BOOL finished)
         {
         }];
    }
    
    
    
}

#pragma mark AmazonAdViewDelegate
// @required
//- (UIViewController *)viewControllerForPresentingModalView {
//    return self;
//}



#pragma mark ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    //mIsLoaded = true;
    
    [self showBannerView];
    
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    {
        _adBannerViewIsVisible = false;
        
    }
    
    if(_adBannerView)
    {
        [_adBannerView removeFromSuperview];
        _adBannerView = nil;
    }
    
    AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));
    
    //[app bannerDidFail];
}

-(void)RemoveiAd
{
    _adBannerViewIsVisible = false;
    
    [self dismissAdView];
    //[_adBannerView removeFromSuperview];
}





-(void)hideBannerView
{
    AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));
    
    if (!_adBannerViewIsVisible)
    {
        return;
    }
    
    if (_adBannerView)
    {
        _adBannerViewIsVisible = false;
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        //CGSize s = [[CCDirector sharedDirector] viewSize];
        
        
        CGRect frame = _adBannerView.frame;
        
        
        frame.origin.x = 0.0f;
        frame.origin.y = -_adBannerView.frame.size.height ;
        
        _adBannerView.frame = frame;
        
        [UIView commitAnimations];
    }
    
}


-(void)dismissAdView
{
    if (_adBannerView)
    {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationCurveEaseOut
                         animations:^
         {
             //CGSize s = [[CCDirector sharedDirector] viewSize];
             
             CGRect frame = _adBannerView.frame;
             frame.origin.y = 0.0f;
             frame.origin.x = 0.0f;
             _adBannerView.frame = frame;
         }
                         completion:^(BOOL finished)
         {
             [_adBannerView removeFromSuperview];
             _adBannerView.delegate = nil;
             _adBannerView = nil;
             
         }];
    }
    
}

-(void) ViewDidload
{
    @try {
        AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));
        
        if(Utility.isAd4)
        {
            NSString *colonyid=Utility.AdcolonyAppID;
            NSString *zone=Utility.AdcolonyZoneID;
            [AdColony configureWithAppID:colonyid zoneIDs:@[zone] options:nil completion:^(NSArray<AdColonyZone *> * zones) {
                
                //AdColony has finished configuring, so let's request an interstitial ad
                [self requestInterstitial];
                showadcolony=false;
                [NSTimer scheduledTimerWithTimeInterval:5.0
                                                 target:self
                                               selector:@selector(onTick:)
                                               userInfo:nil
                                                repeats:YES];
                
                //If the application has been inactive for a while, our ad might have expired so let's add a check for a nil ad object
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBecameActive) name:UIApplicationDidBecomeActiveNotification object:nil];
            }];
            
            
        }
        if(Utility.isAd7)
        {
            
            //vung le
            showadvungle=false;
            VungleSDK* sdk = [VungleSDK sharedSDK];
            NSError *error;
            
            if([sdk isAdPlayable])
            {
                [sdk playAd:app.navController error:&error];
                showadvungle=true;
            }
            [NSTimer scheduledTimerWithTimeInterval:5.0
                                             target:self
                                           selector:@selector(onTickVLe:)
                                           userInfo:nil
                                            repeats:YES];
            
        }
    } @catch (NSException *exception) {
    }         //    if(Utility.isAd5)
    //    {
    //    [self loadInterstitial];
    //    showmopub=false;
    //    [NSTimer scheduledTimerWithTimeInterval:5.0
    //                                     target:self
    //                                   selector:@selector(onTickmopub:)
    //                                   userInfo:nil
    //                                    repeats:YES];
    //    }
    //    FYBSDKOptions *options = [FYBSDKOptions optionsWithAppId:@"00000"
    //                                               securityToken:@"000000000000000000000000"];
    //    [FyberSDK startWithOptions:options];
    //
    //
    //    FYBInterstitialController *interstitialController = [FyberSDK interstitialController];
    //    interstitialController.delegate = self;
    //
    //    // request the offers
    //    [interstitialController requestInterstitial];
    //    [interstitialController presentInterstitialFromViewController:self._viewControler];
    
    
}
//- (void)loadInterstitial {
//    // Instantiate the interstitial using the class convenience method.
//    self.interstitial=[MPInterstitialAdController
//                       interstitialAdControllerForAdUnitId:Utility.MopubID];
//
//    // Fetch the interstitial ad.
//    [self.interstitial loadAd];
//    if (self.interstitial.ready)
//    {
//        [self.interstitial showFromViewController:self._viewControler];
//        showmopub=true;
//    }
//    else {
//        // The interstitial wasn't ready, so continue as usual.
//    }
//
//

//}
-(void)requestInterstitial {
    //Request an interstitial ad from AdColony
    NSString *zone=Utility.AdcolonyZoneID;
    [AdColony requestInterstitialInZone:zone options:nil
     
     //Handler for successful ad requests
                                success:^(AdColonyInterstitial *ad) {
                                    
                                    //Once the ad has finished, set the loading state and request a new interstitial
                                    ad.close = ^{
                                        _ad = nil;
                                        
                                        //[self setLoadingState];
                                        [self requestInterstitial];
                                    };
                                    
                                    //Interstitials can expire, so we need to handle that event also
                                    ad.expire = ^{
                                        _ad = nil;
                                        
                                        //[self setLoadingState];
                                        [self requestInterstitial];
                                    };
                                    
                                    //Store a reference to the returned interstitial object
                                    _ad = ad;
                                    
                                    //Show the user we are ready to play a video
                                    //[self setReadyState];
                                }
     
     //Handler for failed ad requests
                                failure:^(AdColonyAdRequestError *error) {
                                    NSLog(@"SAMPLE_APP: Request failed with error: %@ and suggestion: %@", [error localizedDescription], [error localizedRecoverySuggestion]);
                                }
     ];
}
#pragma mark - Event Handlers

-(void)onBecameActive {
    //If our ad has expired, request a new interstitial
    if (!_ad) {
        [self requestInterstitial];
    }
}
bool showadcolony=false;
-(void)onTick:(NSTimer *)timer {
    //do smth
    AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));

    if (!_ad.expired&&!showadcolony) {
        [_ad showWithPresentingViewController:app.navController];
        showadcolony=true;
    }
}
bool showadvungle=false;
-(void)onTickVLe:(NSTimer *)timer {
    //do smth
    AppController * app = (((AppController*) [UIApplication sharedApplication].delegate));

    VungleSDK* sdk = [VungleSDK sharedSDK];
    NSError *error;
    
    if ([sdk isAdPlayable]&&!showadvungle) {
        
        [sdk playAd:app.navController error:&error];
        
        showadvungle=true;
    }
}



@end
