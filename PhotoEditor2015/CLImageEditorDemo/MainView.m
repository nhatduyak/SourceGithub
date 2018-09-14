//
//  MainView.m
//  Magic editor Pictures
//
//  Created by Duy Nguyen on 6/19/14.
//  Copyright (c) 2014 CALACULU. All rights reserved.
//

#import "MainView.h"
#import "PostViewController.h"
@import GoogleMobileAds;
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <AmazonAd/AmazonAdView.h>
#import <AmazonAd/AmazonAdOptions.h>
#import <AmazonAd/AmazonAdError.h>
#import <AdColony/AdColony.h>
#import "EditorPhoto2015-Swift.h"

@interface MainView ()
//@property(nonatomic, strong) GADInterstitial *interstitial;
//@property(nonatomic, weak) IBOutlet GADBannerView *bannerView;
@property (nonatomic, retain) AmazonAdView *amazonAdView;
//@property (nonatomic, retain) NSTimer *timerVPN;
@property (nonatomic, retain) GADBannerView *gBannerView;

@end

@implementation MainView
@synthesize amazonAdView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //============================
    //==========FOR AD============
    //============================
    
    MyAd *myad =[[MyAd alloc] initWithRoot:self];
    [myad ViewDidload];
    
    //============================
    //============================
    //============================



}

#pragma mark AmazonAdViewDelegate
// @required
- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

// @optional
- (void)adViewWillExpand:(AmazonAdView *)view {
    NSLog(@"Will present modal view for an ad. Its time to pause other activities.");
}

// @optional
- (void)adViewDidCollapse:(AmazonAdView *)view {
    NSLog(@"Modal view has been dismissed, its time to resume the paused activities.");
}

// @optional
- (void)adViewDidLoad:(AmazonAdView *)view {
    NSLog(@"Successfully loaded an ad");
}

// @optional
- (void)adViewDidFailToLoad:(AmazonAdView *)view withError:(AmazonAdError *)error {
    NSLog(@"Ad Failed to load. Error code %d: %@", error.errorCode, error.errorDescription);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CaptureClick:(id)sender {
    SCNavigationController *nav = [[SCNavigationController alloc] init];
    nav.scNaigationDelegate = self;
    [nav showCameraWithParentController:self];
}

- (IBAction)clickShowconfig:(id)sender {
    [self showConfig];

}
- (void)showConfig
{
    //    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"StoryboardAD" bundle:nil];
    //
    //    AdManagerView *gameCenterController = [sb instantiateViewControllerWithIdentifier:@"AdView1"];
    //    gameCenterController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    //    if (gameCenterController != nil)
    //    {
    //        //            gameCenterController.gameCenterDelegate = self;
    //        //            gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
    //        //        gameCenterController.leaderboardIdentifier = @"com.piyaphat.TestGameCenter.TestGameCenterBike";
    //
    UIViewController *vc = self.view.window.rootViewController;
    //        [vc presentViewController: gameCenterController animated: YES completion:nil];
    //
    //
    //    }
    [Utility OpenView:@"AdView1" view:vc];
    //    Utility *u=[[Utility alloc] init];
    //        [u OpenView:@"AdView1" view:vc];
    
    
}

@end
