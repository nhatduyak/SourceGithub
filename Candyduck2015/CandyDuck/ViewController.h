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
@interface ViewController : UIViewController<GKGameCenterControllerDelegate,ADBannerViewDelegate>{
    SLComposeViewController* slComposeViewController;
    BOOL requestingAd;
    
}

@end