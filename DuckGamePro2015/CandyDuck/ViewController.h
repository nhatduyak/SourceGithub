//
//  ViewController.h
//  CandyDuck
//

//  Copyright (c) 2557 Amornthep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameKit/GameKit.h>
#import <Social/Social.h>
#import <iAd/iAd.h>
#import <MillennialMedia/MMAdView.h>
#import "AppDelegate.h"
@interface ViewController : UIViewController<GKGameCenterControllerDelegate,ADBannerViewDelegate>{
    SLComposeViewController* slComposeViewController;
}
#define MILLENNIAL_IPHONE_AD_VIEW_FRAME CGRectMake(0, 0, 320, 50)
#define MILLENNIAL_IPAD_AD_VIEW_FRAME CGRectMake(0, 0, 728, 90)
#define MILLENNIAL_AD_VIEW_FRAME ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? MILLENNIAL_IPAD_AD_VIEW_FRAME : MILLENNIAL_IPHONE_AD_VIEW_FRAME)
@end
