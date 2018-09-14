//
//  AppDelegate.m
//  iFruit
//
//  Created by mac on 13-10-25.
//  Copyright Nightelf 2013年. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
//#import "IntroLayer.h"
#import "MenuLayer.h"
#import "GCHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
#import <AdColony/AdColony.h>
//#import <VungleSDK/VungleSDK.h>
#import "CandyFruitGame-Swift.h"
//#import <Chartboost/Chartboost.h>
@implementation MyNavigationController

// The available orientations should be defined in the Info.plist file.
// And in iOS 6+ only, you can override it in the Root View controller in the "supportedInterfaceOrientations" method.
// Only valid for iOS 6+. NOT VALID for iOS 4 / 5.
-(NSUInteger)supportedInterfaceOrientations {
	
	// iPhone only
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		//return UIInterfaceOrientationMaskLandscape;
        return UIInterfaceOrientationMaskPortrait;
	
	// iPad only
	//return UIInterfaceOrientationMaskLandscape;
    return UIInterfaceOrientationMaskPortrait;
}

// Supported orientations. Customize it for your own needs
// Only valid on iOS 4 / 5. NOT VALID for iOS 6.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// iPhone only
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		//return UIInterfaceOrientationIsLandscape(interfaceOrientation);
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
	
	// iPad only
	// iPhone only
	//return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (BOOL) shouldAutorotate {
    return NO;
}

// This is needed for iOS4 and iOS5 in order to ensure
// that the 1st scene has the correct dimensions
// This is not needed on iOS6 and could be added to the application:didFinish...
-(void) directorDidReshapeProjection:(CCDirector*)director
{
	if(director.runningScene == nil) {
		// Add the first scene to the stack. The director will draw it immediately into the framebuffer. (Animation is started automatically when the view is displayed.)
		// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
		//[director runWithScene: [IntroLayer scene]];
        [director runWithScene: [MenuLayer scene]];
        //[director runWithScene: [GameLayer scene]];
	}
}
@end

@implementation AppController

@synthesize window=window_, navController=navController_, director=director_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
    
    
//    if(Utility.isAd7)
//    {
//        VungleSDK* sdk = [VungleSDK sharedSDK];
//        // start vungle publisher library
//        [sdk startWithAppId:Utility.VungleID];
//        [sdk setLoggingEnabled:true];
//        [sdk clearCache];
//        [sdk clearSleep];
//    }
    
    
    if(Utility.isAd8)
    {
    }
    
    if(Utility.isAd5)
    {
        
//        //Initialize the Chartboost library
//        [Chartboost startWithAppId:Utility.ChartboostAppID
//                      appSignature:Utility.ChartboostSign
//                          delegate:self];
        
        
    }
    
      //============================
    //======END FOR AD============
    //============================
    
    // start vungle publisher library
	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	
	// CCGLView creation
	// viewWithFrame: size of the OpenGL view. For full screen use [_window bounds]
	//  - Possible values: any CGRect
	// pixelFormat: Format of the render buffer. Use RGBA8 for better color precision (eg: gradients). But it takes more memory and it is slower
	//	- Possible values: kEAGLColorFormatRGBA8, kEAGLColorFormatRGB565
	// depthFormat: Use stencil if you plan to use CCClippingNode. Use Depth if you plan to use 3D effects, like CCCamera or CCNode#vertexZ
	//  - Possible values: 0, GL_DEPTH_COMPONENT24_OES, GL_DEPTH24_STENCIL8_OES
	// sharegroup: OpenGL sharegroup. Useful if you want to share the same OpenGL context between different threads
	//  - Possible values: nil, or any valid EAGLSharegroup group
	// multiSampling: Whether or not to enable multisampling
	//  - Possible values: YES, NO
	// numberOfSamples: Only valid if multisampling is enabled
	//  - Possible values: 0 to glGetIntegerv(GL_MAX_SAMPLES_APPLE)
	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
								   pixelFormat:kEAGLColorFormatRGB565
								   depthFormat:0
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
    
    //[glView setMultipleTouchEnabled:YES]; //开启多点触摸
	
	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
	
	director_.wantsFullScreenLayout = YES;
	
	// Display FSP and SPF
	//[director_ setDisplayStats:YES];
	
	// set FPS at 60
	//[director_ setAnimationInterval:1.0/60];
	
	// attach the openglView to the director
	[director_ setView:glView];
	
	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
	//	[director setProjection:kCCDirectorProjection3D];
	
    if(isPad)
        [director_ enableRetinaDisplay:NO];
    else{
        // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
        if( ! [director_ enableRetinaDisplay:YES] )
            CCLOG(@"Retina Display Not supported");
    }

	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change this setting at any time.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
//	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
//	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
//	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"
    
    [sharedFileUtils setiPhoneRetinaDisplaySuffix:@"@2x"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"@2x"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"@2x"];	// Default on iPad RetinaDisplay is "-ipadhd"
	
	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
	
	// Create a Navigation Controller with the Director
	navController_ = [[MyNavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;

	// for rotation and other messages
	[director_ setDelegate:navController_];
    
	// set the Navigation Controller as the root view controller
	[window_ setRootViewController:navController_];
    
	// make main window visible
	[window_ makeKeyAndVisible];
    
    //[[GCHelper sharedInstance] authenticateLocalUser];
	
	return YES;
}
- (void)unityAdsVideoCompleted:(NSString *)rewardItemKey skipped:(BOOL)skipped
{
    
}

// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];	
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
    //[AdBuddiz setPublisherKey:@"ac1d83cf-f685-4a34-9b2c-2e7f4613ac21"];
     //[AdBuddiz setTestModeActive];
    //[AdBuddiz cacheAds];
     //[AdBuddiz showAd];
//    [AdTapsy setDelegate:navController_];
//    [AdTapsy showInterstitial:navController_];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}

// application will be killed
- (void)applicationWillTerminate:(UIApplication *)application
{
    //[AdTapsy destroy];
	CC_DIRECTOR_END();
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[window_ release];
	[navController_ release];
	
	[super dealloc];
}
@end
