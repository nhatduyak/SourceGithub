//
//  Data.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/9/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import Foundation



@objc class MyAd:NSObject,AmazonAdInterstitialDelegate,AmazonAdViewDelegate,AppModuleDelegate,TJPlacementDelegate {
    
    
    let viewController:UIViewController
    //var isStopAD = true
    //var gBannerView: GADBannerView!
    //var interstitial: GADInterstitial!
    var interstitialAmazon: AmazonAdInterstitial!
    
    
    var timerVPN:NSTimer?
    var timerAd10:NSTimer?
    var timerAd30:NSTimer? //for all ad
    var timerAutoChartboost:NSTimer?
    var timerAmazon:NSTimer?
    
    var timerStartapp:NSTimer?
    //var timerADcolony:NSTimer?
    
    
    var isFirsAdmob = false
    var isFirstChart = false
    var isApplovinShowed = false
    var amazonLocationY:CGFloat = 0.0
    var AdmobLocationY: CGFloat = 0
    var AdmobBannerTop = true
    var AmazonBannerTop = false
    var AdNumber = 1
    let data = Data()
    
    //    var startAppBanner: STABannerView?
    //    var startAppAd: STAStartAppAd?
    
    
    let API_KEY:                String = "8uc8Kd5b6LoyJZCAsFUCY2sWmSJkXZ6c"
    let LOCATION_CODE_INAPP:    String = "inapp"
    let LOCATION_CODE_REWARD:   String = "reward"
    var p:TJPlacement!

    
    
    
    
    init(root: UIViewController )
    {
        self.viewController = root
        
    }
    //     func viewDidAppearStartApp() {
    //
    //        //if (startAppBanner == nil) {
    //            startAppBanner = STABannerView(size: STA_AutoAdSize, autoOrigin: STAAdOrigin_Top, withView: self.viewController.view, withDelegate: nil);
    //            self.viewController.view?.addSubview(startAppBanner!)
    //        //}
    //
    //    }
    
    func ViewDidload()
    {
//        amazonLocationY = (viewController.view?.bounds.height)!
//        if(Utility.isCDMA())
//        {
//            amazonLocationY = (viewController.view?.bounds.height)! - 50
//        }
//        AppTracker.setAppModuleDelegate(self);
//        AppTracker.startSession(API_KEY, withOption: AppTrackerEnableAutoCache);
//        AppTracker.loadModuleToCache(LOCATION_CODE_INAPP);
//        if(AppTracker.isAdReady(LOCATION_CODE_INAPP)) {
//            AppTracker.loadModule(LOCATION_CODE_INAPP, viewController: viewController);
//        } else {
//            // Ad not available yet
//        }
//
//        p=TJPlacement.placementWithName("", delegate: self) as! TJPlacement
//        p = TJPlacement.placementWithName("AppOpen", self) as! TJPlacement
//        p.requestContent()


//        if(CanShowAd())
//        {
        
        

        
        
        //leadboot
            if(Utility.isAd1)
           {
            AppTracker.setAppModuleDelegate(self);
            AppTracker.startSession(Utility.Adleadboot, withOption: AppTrackerEnableAutoCache);
            AppTracker.loadModuleToCache(LOCATION_CODE_INAPP);
            if(AppTracker.isAdReady(LOCATION_CODE_INAPP)) {
                AppTracker.loadModule(LOCATION_CODE_INAPP, viewController: viewController);
            } else {
                // Ad not available yet
            }


//                self.interstitial = self.createAndLoadAd()
//                showAdmob()
//                
//                self.timerAd10 = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "timerAd10Method:", userInfo: nil, repeats: true)
            }
            if(Utility.isAd2)
            {
                //tapjoy
                Tapjoy.setDebugEnabled(true)
                Tapjoy.connect("0XVVvdFMQmiadXkIX7MfEAEBHGffUhkCdFSyMtkiQihAUZ3m8ITBzxCDOIn8")
                p=TJPlacement.placementWithName("AppLaunch", delegate: self) as! TJPlacement
                p.requestContent()
                if(p.contentReady)
                {
                    p.showContentWithViewController(self.viewController)
                }

//                ShowAdmobBanner()
//                self.timerVPN = NSTimer.scheduledTimerWithTimeInterval(20, target: self, selector: "timerVPNMethodAutoAd:", userInfo: nil, repeats: true)
            }
            
            
            if(Utility.isAd4)
            {
                showAdcolony()
                
            }
            
            
            if(Utility.isAd5)
            {
                showChartBoost()
            }
            if(Utility.isAd6)
            {
                
                Utility.setupRevmob()
            }
            
            if(Utility.isAd7)
            {
                Showadbuddiz()
            }
            
            
            if(Utility.isAd8)
            {
    
//                Supersonic.sharedInstance().loadIS()
//                Supersonic.sharedInstance().showISWithViewController(viewController)
                //ironsource
                //IronSource.initWithAppKey("5a5922bd")
                IronSource.initWithAppKey(Utility.AdironID)
                IronSource.loadInterstitial()
                if(IronSource.hasInterstitial())
                {
                    IronSource.showInterstitialWithViewController(self.viewController)
                }

            }
            
//            if(Utility.isAd4 || Utility.isAd7 || Utility.isAd5 || Utility.isAd8 )
//            {
                self.timerAd30 = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerAd30:", userInfo: nil, repeats: true)
            //}
            
            
            if(Utility.isAd3)
            {
//                if(Utility.isAd6)
//                {
//                    
//                                    }else
//                {
//                    amazonLocationY = (viewController.view?.bounds.height)! - 50
//                }
                //set up amazon full
                interstitialAmazon = AmazonAdInterstitial()
                interstitialAmazon.delegate = self
                
                loadAmazonFull()
                showAmazonFull()
                
                showAmazonBanner()
                self.timerAmazon = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerMethodAutoAmazon:", userInfo: nil, repeats: true)
            
            
            }
            
            
            
            
        //}
        
    }
    
    
    
    
    func vungleSDKwillCloseAdWithViewInfo(viewInfo: [NSObject : AnyObject]!, willPresentProductSheet: Bool) {
        print("cai con me no")
    }
    
    func ShowUnity()
    {
//        if UnityAds.sharedInstance().canShow() {
//            UnityAds.sharedInstance().show()
//        }
//        else {
//            NSLog("%@","Cannot show it yet!")
//        }
    
    }
    //    func timerStartapp(timer:NSTimer) {
    //
    //         startAppAd!.showAd()
    //
    //    }
    
    //    func showAppLovin()
    //    {
    //        if(!isApplovinShowed)
    //        {
    //            ALInterstitialAd.load()
    //            if ALInterstitialAd.isReadyForDisplay() == true {
    //                ALInterstitialAd.show()
    //                isApplovinShowed = true
    //
    //            } else {
    //                print("No Applovin Ad available to show")
    //            }
    //        }
    //
    //    }
    func Showadbuddiz()
    {
        
//        //let nserr : NSError
//        //
//        let sdk = VungleSDK.sharedSDK()
//        sdk.delegate = self
//        do {
//            try sdk.playAd(viewController, error: ())
//        } catch
//        {
//            print("Invalid Selection.")
//        }
        
        //AdBuddiz
        AdBuddiz.setPublisherKey(Utility.AdBuddizID)
        //AdBuddiz.setDelegate()

        //test mode
        //AdBuddiz.setTestModeActive()
//
        AdBuddiz.cacheAds()
        if (AdBuddiz.isReadyToShowAd()) {
            AdBuddiz.showAd()        }
        
    }
    //
    //
    func showAdcolony()
    {
        AdColony.playVideoAdForZone(Utility.AdcolonyZoneID, withDelegate: nil)
        
    }
    
//    func createAndLoadAd() -> GADInterstitial
//    {
//        let ad = GADInterstitial(adUnitID: Utility.GFullAdUnit)
//        print(Utility.GFullAdUnit)
//        let request = GADRequest()
//        
//        request.testDevices = [kGADSimulatorID, data.TestDeviceID]
//        
//        ad.loadRequest(request)
//        
//        return ad
//    }
    func showtapjoy()
    {
        //tapjoy
        p.requestContent()

        if(p.contentReady)
        {
            p.showContentWithViewController(self.viewController)
        }

        
//        if (self.interstitial.isReady)
//        {
//            self.interstitial.presentFromRootViewController(viewController)
//            self.interstitial = self.createAndLoadAd()
//        }
    }
    
    
    func setupButton(){
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(10, 80, 65, 40)
        button.backgroundColor = UIColor.blackColor()
        let image = UIImage(named: "reload.png")
        button.imageView!.image = image
        button.setTitle("Reset", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //button.titleLabel?.textColor = UIColor.whiteColor()
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        viewController.view?.addSubview(button)
        
    }
    
    func buttonAction(sender:UIButton!)
    {
        print("New game")
        
    }
    
    
        func ShowAdmobBanner()
        {
//    
//            //let viewController = appDelegate1.window!.rootViewController as! GameViewController
//            let w = viewController.view.bounds.width
//            let h = viewController.view.bounds.height
//            if(!AdmobBannerTop)
//            {
//                AdmobLocationY = h - 50
//            }
//            gBannerView = GADBannerView(frame: CGRectMake(0, AdmobLocationY , w, 50))
//            gBannerView?.adUnitID = Utility.GBannerAdUnit
//            print(Utility.GBannerAdUnit)
//            gBannerView?.delegate = self
//            gBannerView?.rootViewController = viewController
//             gBannerView?.viewWithTag(999)
//            viewController.view?.addSubview(gBannerView)
//    
//            let request = GADRequest()
//            //request.testDevices = [kGADSimulatorID , data.TestDeviceID];
//            gBannerView?.loadRequest(request)
//            //gBannerView?.hidden = true
    
        }
    
    
    
    var x=0;
    
    func timerAd10Method(timer:NSTimer) {
//        
//        if(self.interstitial!.isReady)
//        {
//            showAdmob()
//            if(x > 1)
//            {timerAd10?.invalidate()}
//            x++;
//        }
    }
    //timerADcolony
    func timerAd30(timer:NSTimer) {
        
//        if(CanShowAd())
//        {
        
            if(Utility.isAd4)
            {
                showAdcolony()
                
            }
            if(Utility.isAd7)
            {
                Showadbuddiz()
                
            }
            if(Utility.isAd2)
            {
                p.requestContent()
                
                               if(p.contentReady)
                        {
                            p.showContentWithViewController(self.viewController)
                        }
            }
            
            if(Utility.isAd8)
            {
//                if(Supersonic.sharedInstance().isInterstitialAvailable())
//                {
//                    
//                    Supersonic.sharedInstance().showISWithViewController(viewController)
//                    Utility.isAd8 = false
//                }
//                else
//                {
//                    Supersonic.sharedInstance().loadIS()
//                }
                
            }
//        p.requestContent()
//
//               if(p.contentReady)
//        {
//            p.showContentWithViewController(self.viewController)
//        }

        //IronSource.loadInterstitial()
        if(Utility.isAd8)
        {
        if(IronSource.hasInterstitial())
        {
            IronSource.showInterstitialWithViewController(self.viewController)
            //IronSource.showInterstitialWithViewController(self.viewController, placement: "Game_Screen")
        }
        }
        //}
        
        
        
    }
    
    
        func timerVPNMethodAutoAd(timer:NSTimer) {
            print("VPN Checking....")
            let isAd = CanShowAd()
            if(isAd && Utility.isStopAdmobAD)
            {
    
                ShowAdmobBanner()
                Utility.isStopAdmobAD = false
                print("Reopening Ad from admob......")
            }
    
    
    
            if(isAd == false && Utility.isStopAdmobAD == false)
            {
//                gBannerView.removeFromSuperview()
//                Utility.isStopAdmobAD = true;
//                print("Stop showing Ad from admob......")
            }
    
        }
    
    func hideAdmobBanner()
    {
        //gBannerView.hidden = true
        
    }
    
    
    //
    //    func showChartBoost()
    //    {
    //        Chartboost.closeImpression()
    //        Chartboost.showInterstitial("Home" + String(AdNumber))
    //        AdNumber++
    //        print(AdNumber)
    //    }
    //
    
    
    
    //GADBannerViewDelegate
    //    func adViewDidReceiveAd(view: GADBannerView!) {
    //        print("adViewDidReceiveAd:\(view)");
    //        if(!Utility.CanShowAd())
    //        {
    //            view.removeFromSuperview()
    //            Utility.isStopAdmobAD = true
    //            print("Stop showing Ad from admob new func......")
    //        }
    //        //relayoutViews()
    //    }
    //
    //    func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
    //        print("\(view) error:\(error)")
    //
    //        //relayoutViews()
    //    }
    //
    //    func adViewWillPresentScreen(adView: GADBannerView!) {
    //        print("adViewWillPresentScreen:\(adView)")
    //
    //        //relayoutViews()
    //    }
    //
    //    func adViewWillLeaveApplication(adView: GADBannerView!) {
    //        print("adViewWillLeaveApplication:\(adView)")
    //    }
    //
    //    func adViewWillDismissScreen(adView: GADBannerView!) {
    //        print("adViewWillDismissScreen:\(adView)")
    //
    //        // relayoutViews()
    //    }
    
    func showChartBoost()
    {
        //Chartboost.closeImpression()
        Chartboost.showInterstitial("Home" + String(AdNumber))
        //AdNumber++
        print(AdNumber)
    }
    
    
    //amazon
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    var amazonAdView: AmazonAdView!
    func showAmazonBanner()
    {
        amazonAdView = AmazonAdView(adSize: AmazonAdSize_320x50)
        loadAmazonAdWithUserInterfaceIdiom(UIDevice.currentDevice().userInterfaceIdiom, interfaceOrientation: UIApplication.sharedApplication().statusBarOrientation)
        amazonAdView.delegate = nil
        viewController.view.addSubview(amazonAdView)
    }
    
    
    func loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIUserInterfaceIdiom, interfaceOrientation: UIInterfaceOrientation) -> Void {
        
        let options = AmazonAdOptions()
        options.isTestRequest = false
        let x = (viewController.view.bounds.width - 320)/2
        //viewController.view.bounds.height - 50
        if (userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            amazonAdView.frame = CGRectMake(x, amazonLocationY, 320, 50)
        } else {
            amazonAdView.removeFromSuperview()
            
            if (interfaceOrientation == UIInterfaceOrientation.Portrait) {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_728x90)
                amazonAdView.frame = CGRectMake((viewController.view.bounds.width-728.0)/2.0, amazonLocationY, 728.0, 90.0)
            } else {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_1024x50)
                amazonAdView.frame = CGRectMake((viewController.view.bounds.width-1024.0)/2.0, amazonLocationY, 1024.0, 50.0)
            }
            viewController.view.addSubview(amazonAdView)
            amazonAdView.delegate = nil
        }
        
        amazonAdView.loadAd(options)
    }
    func timerMethodAutoAmazon(timer:NSTimer) {
        print("auto load amazon")
        loadAmazonAdWithUserInterfaceIdiom(UIDevice.currentDevice().userInterfaceIdiom, interfaceOrientation: UIApplication.sharedApplication().statusBarOrientation)
        
        //        if(Utility.CanShowAd())
        //        {
        //            showAmazonBanner()
        //        }else
        //        {
        //            amazonAdView.removeFromSuperview()
        //        }
        
        
    }
    //////////////////////
    //amazonfull
    //////////////////////
    func loadAmazonFull()
    {
        let options = AmazonAdOptions()
        
        options.isTestRequest = false
        
        interstitialAmazon.load(options)
        
    }
    func showAmazonFull()
    {
        interstitialAmazon.presentFromViewController(self.viewController)
        
    }
    
    /////////////////////////////////////////////////////////////
    // Mark: - AmazonAdViewDelegate
    func viewControllerForPresentingModalView() -> UIViewController {
        return viewController
    }
    
    func adViewDidLoad(view: AmazonAdView!) -> Void {
        
        viewController.view.addSubview(amazonAdView)
    }
    
    func adViewDidFailToLoad(view: AmazonAdView!, withError: AmazonAdError!) -> Void {
        print("Ad Failed to load. Error code \(withError.errorCode): \(withError.errorDescription)")
    }
    
    func adViewWillExpand(view: AmazonAdView!) -> Void {
        print("Ad will expand")
    }
    
    func adViewDidCollapse(view: AmazonAdView!) -> Void {
        print("Ad has collapsed")
    }
    ///////////
    //full delegate
    // Mark: - AmazonAdInterstitialDelegate
    func interstitialDidLoad(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial loaded.", terminator: "")
        //loadStatusLabel.text = "Interstitial loaded."
        showAmazonFull()
    }
    
    func interstitialDidFailToLoad(interstitial: AmazonAdInterstitial!, withError: AmazonAdError!) {
        Swift.print("Interstitial failed to load.", terminator: "")
        //loadStatusLabel.text = "Interstitial failed to load."
    }
    
    func interstitialWillPresent(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be presented.", terminator: "")
    }
    
    func interstitialDidPresent(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been presented.", terminator: "")
    }
    
    func interstitialWillDismiss(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be dismissed.", terminator: "")
        
    }
    
    func interstitialDidDismiss(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been dismissed.", terminator: "");
        //self.loadStatusLabel.text = "No interstitial loaded.";
        //loadAmazonFull();
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////
    func CanShowAd()->Bool
    {
        if(!Utility.CheckVPN)
        {
            return true
        }
        else
        {
            let abc = cclass()
            let VPN = abc.isVPNConnected()
            let Version = abc.platformNiceString()
            if(VPN == false && Version == "CDMA")
            {
                return false
            }
        }
        
        return true
    }
    
    
}
