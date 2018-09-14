//
//  AppDelegate.m
//  CandyDuck
//
//  Created by Amornthep on 2/8/2557 BE.
//  Copyright (c) 2557 Amornthep. All rights reserved.
//

#import "AppDelegate.h"
#import "MonkeyKingFruitGames-Swift.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:2.0];
    //chartboost
//    [Chartboost startWithAppId:@"56b4422004b0161b11c43ddf"
//                  appSignature:@"659a4fced4b821ecedbf5cc673ea4d1a4f7a2248"
//                      delegate:self];
    //amazon
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
    
    
    if(Utility.isAd7)
    {
        VungleSDK* sdk = [VungleSDK sharedSDK];
        // start vungle publisher library
        [sdk startWithAppId:Utility.VungleID];
        [sdk setLoggingEnabled:true];
        [sdk clearCache];
        [sdk clearSleep];
    }
    
    if(Utility.isAd5)
    {
        
        //Initialize the Chartboost library
        [Chartboost startWithAppId:Utility.ChartboostAppID
                      appSignature:Utility.ChartboostSign
                          delegate:self];
        
        
    }
    return YES;
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
