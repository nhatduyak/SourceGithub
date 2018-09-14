//
//  MainView.h
//  Magic editor Pictures
//
//  Created by Duy Nguyen on 6/19/14.
//  Copyright (c) 2014 CALACULU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCNavigationController.h"
#import <iAd/iAd.h>
//@class GADBannerView;
@interface MainView : UIViewController<SCNavigationControllerDelegate>
{
    BOOL bannerIsVisible;
}

@property (strong, nonatomic) IBOutlet UIButton *btCapture;
- (IBAction)CaptureClick:(id)sender;
- (IBAction)clickShowconfig:(id)sender;
//@property (strong, nonatomic) IBOutlet ADBannerView *adbanner;
@end
