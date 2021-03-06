//
//  ViewController.h
//  CLImageEditorDemo
//
//  Created by sho yakushiji on 2013/11/14.
//  Copyright (c) 2013年 CALACULU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITabBarDelegate, UIActionSheetDelegate, UIScrollViewDelegate,ADBannerViewDelegate>
{
    IBOutlet __weak UIScrollView *_scrollView;
    IBOutlet __weak UIImageView *_imageView;
    BOOL bannerIsVisible;

}
@property (strong, nonatomic) IBOutlet ADBannerView *adbanner;
@property (strong, nonatomic) IBOutlet UITabBarItem *btshare;

@end