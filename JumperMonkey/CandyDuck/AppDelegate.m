//
//  AppDelegate.m
//  CandyDuck
//
//  Created by Amornthep on 2/8/2557 BE.
//  Copyright (c) 2557 Amornthep. All rights reserved.
//

#import "AppDelegate.h"
#import <AmazonAd/AmazonAdRegistration.h>
#import "JumperMonkey-Swift.h"
#import <Chartboost/Chartboost.h>
#import <Chartboost/CBAnalytics.h>
#import <Chartboost/CBInPlay.h>
#import <Tapjoy/Tapjoy.h>
#import <IronSource/IronSource.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:2.0];
   // [[AmazonAdRegistration sharedRegistration] setAppKey:@"f06fee177a47403eb8f3f206517f430d"];
//    [Chartboost startWithAppId:@"56b4d472a8b63c332c0bf039"
//                  appSignature:@"7ef835e01076db5a292b47b066cbe4d945556d51"
//                      delegate:self];
    //[Flurry startSession: @"FGTG3DS5YFHY2JZXVTDH"];//@"6Z27CWHJXRC29QVJZX4R"];//
    
    //enabling test mode to see video ads, remove this line if you dont want to see test ads.
    //[FlurryAds enableTestAds:YES];
    
    //to enable Flurry logging uncomment the following two lines
//    [Flurry setDebugLogEnabled:YES];
//    [Flurry setLogLevel:FlurryLogLevelAll];
    //amazon
    
    @try {
        [Utility SetUpAdData];
        
        [[AmazonAdRegistration sharedRegistration] setAppKey:Utility.Amazonkey];
        [[AmazonAdRegistration sharedRegistration] setLogging:true];
        //AmazonAdRegistration.sharedRegistration().setAppKey(Utility.Amazonkey)
        //AmazonAdRegistration.sharedRegistration().setLogging(true)
        //}
        

        if(Utility.isAd4)
        {
            
            //AdColony.configureWithAppID(Utility.AdcolonyAppID, zoneIDs: [Utility.AdcolonyZoneID], delegate: nil, logging: true)
            
            
            [AdColony configureWithAppID:Utility.AdcolonyAppID zoneIDs:@[Utility.AdcolonyZoneID] delegate:nil logging:true];
            
            
        }
        
        
        if(Utility.isAd5)
        {
            //chartboots
            //Initialize the Chartboost library
//            [Chartboost startWithAppId:Utility.ChartboostAppID
//                          appSignature:Utility.ChartboostSign
//                              delegate:self];
            // Begin a user session. Must not be dependent on user actions or any prior network requests.
            [Chartboost startWithAppId: Utility.ChartboostAppID appSignature:Utility.ChartboostSign delegate:self];
            
        }
//        if(utility.isAd8)
//        {
//            [IronSource initWithAppKey:@"5a5922bd" adUnits:@"6359"];
//
//        }
        //Turn on Tapjoy debug mode
        
//        [Tapjoy setDebugEnabled:YES]; 
//        [Tapjoy connect:@"0XVVvdFMQmiadXkIX7MfEAEBHGffUhkCdFSyMtkiQihAUZ3m8ITBzxCDOIn8"];
        //============================
        //======END FOR AD============
        //============================
        
        
        
        
    }
    @catch (NSException *exception) {
        return YES;
    }
    @finally {
        
    }

    return YES;
}
- (void)unityAdsVideoCompleted:(NSString *)rewardItemKey skipped:(BOOL)skipped
{
    
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)showAds{
    
//    [self.window addSubview:self.bannerView_];
//    GADRequest *request = [GADRequest request];
//    [self.bannerView_ loadRequest:request];
//    [self.window bringSubviewToFront:self.bannerView_];
}

//-(GADBannerView *)bannerView_{
//    if (bannerView_ == nil) {
////        GADRequest *request = [GADRequest request];
//        
//        bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
//        
//        bannerView_.adUnitID = @"e4a2102fe20a4f66";
//        
//        bannerView_.rootViewController = (UIViewController*)self;
//        
//        [self.window addSubview:bannerView_];
//        
////        [bannerView_ loadRequest:request];
//    }
//    return bannerView_;
//}

@end
