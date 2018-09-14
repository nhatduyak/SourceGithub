//
//  ViewCaption.m
//  Magic editor Pictures
//
//  Created by Duy Nguyen on 6/19/14.
//  Copyright (c) 2014 CALACULU. All rights reserved.
//

#import "ViewCaption.h"
#import "PostViewController.h"

@interface ViewCaption ()

@end

@implementation ViewCaption

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
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 80, 40);
    btn.center = self.view.center;
    [btn setTitle:@"show" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self configureNotification:YES];
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
- (void)configureNotification:(BOOL)toAdd {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationTakePicture object:nil];
    if (toAdd) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callbackNotificationForFilter:) name:kNotificationTakePicture object:nil];
    }
}

- (void)callbackNotificationForFilter:(NSNotification*)noti {
    UIViewController *cameraCon = noti.object;
    if (!cameraCon) {
        return;
    }
    UIImage *finalImage = [noti.userInfo objectForKey:kImage];
    if (!finalImage) {
        return;
    }
    PostViewController *con = [[PostViewController alloc] init];
    con.postImage = finalImage;
    
    if (cameraCon.navigationController) {
        [cameraCon.navigationController pushViewController:con animated:YES];
    } else {
        [cameraCon presentModalViewController:con animated:YES];
    }
}

- (void)btnPressed:(id)sender {
    SCNavigationController *nav = [[SCNavigationController alloc] init];
    nav.scNaigationDelegate = self;
    [nav showCameraWithParentController:self];
}

#pragma mark - SCNavigationController delegate
- (void)didTakePicture:(SCNavigationController *)navigationController image:(UIImage *)image {
    PostViewController *con = [[PostViewController alloc] init];
    con.postImage = image;
    [navigationController pushViewController:con animated:YES];
}
@end
