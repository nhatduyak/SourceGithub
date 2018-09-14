//
//  Utility.swift
//  Spin Hexagon
//
//  Created by Phuong Nguyen on 2/25/16.
//  Copyright © 2016 Phuong Nguyen. All rights reserved.
//

import Foundation

@objc class Utility:NSObject {
    
    static var isAd1 = false//admob full
    static var isAd2 = false//Admob Banner
    static var isAd3 = true//Amazon
    static var isAd4 = true//Adcolony
   
    static var isAd5 = false// ==>UnityAds
    static var isAd6 = true//revmob
    
    static var isAd7 = true //vungle
    static var isAd8 = false //Sonic
    
    
    static var CheckOnline = true // on/off check ad online
    static var GBannerAdUnit: String = ""
    static var GFullAdUnit: String = ""
    
    static var AdcolonyAppID: String = ""
    static var AdcolonyZoneID: String = ""
    static var AdmobTestDeviceID: String = ""
    static var RevmobID: String = ""
    static var Amazonkey = ""
    static var StartAppAppID = ""
    static var StartAppAccountID=""
    static var VungleID = ""
    static var UnityGameID = ""
    static var SonicID = ""
    static var isStopAdmobAD = true
    
    
    static var CheckVPN = true
    
    //static var showOtherAd = false //showAd (ngoai tru Admob Banner)
    
    static var abc = cclass()
    static var data = Data()
    static func OpenView(viewName: String, view: UIViewController)
    {
        let storyboard = UIStoryboard(name: "StoryboardAD", bundle: nil)
        
        let WebDetailView = storyboard.instantiateViewControllerWithIdentifier(viewName) as UIViewController
        
        view.presentViewController(WebDetailView , animated: true, completion: nil)
        
    }
    
    static func SetUpAdData()
    {
        
        
        GBannerAdUnit = data.gBanner
        GFullAdUnit = data.gFull
      
        Amazonkey = data.AmazonKey
        
        AdcolonyAppID = data.AdcolonyAppID
        AdcolonyZoneID = data.AdcolonyZoneID
        AdmobTestDeviceID = data.TestDeviceID
        RevmobID = data.RevmobID
        VungleID = data.VungleID
//        UnityGameID = data.UnityGameId
//        SonicID = data.SonicID
 
        
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("adOnline") != nil)
        {
            Utility.CheckOnline = NSUserDefaults.standardUserDefaults().objectForKey("adOnline") as! Bool
            print(NSUserDefaults.standardUserDefaults().objectForKey("adOnline"))
        }
        
        
        //GEt Ad unit online
        
        if(Utility.CheckOnline)
        {
            
            let xmlSetup = ADXML()
            xmlSetup.LoadXML()
        }
        
        //ad1 admob full
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad1") != nil)
        {
            isAd1 = NSUserDefaults.standardUserDefaults().objectForKey("ad1") as! Bool
            
        }
        
        //ad2 banner
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad2") != nil)
        {
            isAd2 = NSUserDefaults.standardUserDefaults().objectForKey("ad2") as! Bool
            
        }
        
        
        //ad3 ...
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad3") != nil)
        {
            isAd3 = NSUserDefaults.standardUserDefaults().objectForKey("ad3") as! Bool
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad4") != nil)
        {
            isAd4 = NSUserDefaults.standardUserDefaults().objectForKey("ad4") as! Bool
            
        }
        
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad5") != nil)
        {
            isAd5 = NSUserDefaults.standardUserDefaults().objectForKey("ad5") as! Bool
            
        }
        
        
        
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad6") != nil)
        {
            isAd6 = NSUserDefaults.standardUserDefaults().objectForKey("ad6") as! Bool
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad7") != nil)
        {
            isAd7 = NSUserDefaults.standardUserDefaults().objectForKey("ad7") as! Bool
            
        }
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad8") != nil)
        {
            isAd8 = NSUserDefaults.standardUserDefaults().objectForKey("ad8") as! Bool
            
        }

        
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("check-VPN") != nil)
        {
            CheckVPN = NSUserDefaults.standardUserDefaults().objectForKey("check-VPN") as! Bool
            
        }
        
        
        
        
        
        
        SetupAdOnline()
        
//        if(Utility.isCDMA())
//        {
//            showOtherAd = true
//        }
        
        
    }

    
    static func SetupAdOnline()
    {
        
        //google
        if(NSUserDefaults.standardUserDefaults().objectForKey("gBannerOnline") != nil)
        {
            GBannerAdUnit = NSUserDefaults.standardUserDefaults().objectForKey("gBannerOnline") as! String
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("gFullOnline") != nil)
        {
            GFullAdUnit = NSUserDefaults.standardUserDefaults().objectForKey("gFullOnline") as! String
        }
        
              //get edited appid & sign from Adcolony
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("adcolonyAppID") != nil)
        {
            AdcolonyAppID = NSUserDefaults.standardUserDefaults().objectForKey("adcolonyAppID") as! String
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("adcolonyZoneID") != nil)
        {
            AdcolonyZoneID = NSUserDefaults.standardUserDefaults().objectForKey("adcolonyZoneID") as! String
            
        }
        
               
        //get amazon online id
        if(NSUserDefaults.standardUserDefaults().objectForKey("amazon") != nil)
        {
            Amazonkey = NSUserDefaults.standardUserDefaults().objectForKey("amazon") as! String
            
        }
        
        //vungle id
        if(NSUserDefaults.standardUserDefaults().objectForKey("vungleid") != nil)
        {
            VungleID = NSUserDefaults.standardUserDefaults().objectForKey("vungleid") as! String
            
        }
        
        
        //unity id
        if(NSUserDefaults.standardUserDefaults().objectForKey("unityid") != nil)
        {
            UnityGameID = NSUserDefaults.standardUserDefaults().objectForKey("unityid") as! String
            
        }
        
        
        //sonic id
        if(NSUserDefaults.standardUserDefaults().objectForKey("sonicid") != nil)
        {
            SonicID = NSUserDefaults.standardUserDefaults().objectForKey("sonicid") as! String
            
        }
        //revmob id
        if(NSUserDefaults.standardUserDefaults().objectForKey("revmobid") != nil)
        {
            RevmobID = NSUserDefaults.standardUserDefaults().objectForKey("revmobid") as! String
            
        }
        
//        //get CDMA status
//        if(NSUserDefaults.standardUserDefaults().objectForKey("show-other-ad-online") != nil)
//        {
//            let tempCDMA = NSUserDefaults.standardUserDefaults().objectForKey("show-other-ad-online") as! String
//            if(tempCDMA == "true")
//            {
//                showOtherAd = true
//            }else
//            {
//                showOtherAd = false
//            }
//            
//        }
        
        
    }
    
    static func isCDMA()->Bool
    {
        //return false
        let Version = abc.platformNiceString()
        if(Version == "CDMA")
        {
            return true
        }
        
        return false
    }
    
 
    
    static func setupRevmob()
    {
        
        let completionBlock: () -> Void = {
            RevMobAds.session().showFullscreen()
        
            
            self.RevmobFull()
            self.RevmobVideo()
            //RevmobPopup()
            self.RevmobBanner()
        }
        let errorBlock: (NSError!) -> Void = {error in
            // check the error
            print(error);
        }
        RevMobAds.startSessionWithAppID(Utility.RevmobID,
            withSuccessHandler: completionBlock, andFailHandler: errorBlock);
        
    }
    static func RevmobBanner()
    {
        let banner = RevMobAds.session()?.bannerView()
        banner?.frame = CGRect(x: 0,y: 70,width: 320,height: 50);
        
        RevMobAds.session()?.showBanner();
    }
    static func RevmobFull()
    {
        RevMobAds.session()?.showFullscreen();
    }
    static func RevmobPopup()
    {
        RevMobAds.session()?.showPopup();
        
    }
    static func RevmobVideo()
    {
        //To load
        RevMobAds.session()?.fullscreen().loadVideo()
        
        //To show
        RevMobAds.session()?.fullscreen().showVideo()
    }
    
//    static func CanShowAd()->Bool
//    {
//        let abc = cclass()
//        let VPN = abc.isVPNConnected()
//        let Version = abc.platformNiceString()
//        if(VPN == false && Version == "CDMA")
//        {
//            return false
//        }
//        
//        
//        return true
//    }
    
    
    
    static func MoreGame()
    {
        let barsLink : String = "itms-apps://itunes.apple.com/ca/developer/phuong-nguyen/id1004963752"
        UIApplication.sharedApplication().openURL(NSURL(string: barsLink)!)
    }
    
    
}
