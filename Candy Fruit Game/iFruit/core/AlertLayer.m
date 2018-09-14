//
//  OptionLayer.m
//  iFruit
//
//  Created by mac on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AlertLayer.h"
#import "DropFruitLayer.h"

@implementation AlertLayer
@synthesize type = _type;

static AlertLayer *alertLayer = nil;

+(AlertLayer *)sharedInstance{
    if (!alertLayer) {
        alertLayer = [AlertLayer node];
    }
    return alertLayer;
}

- (id) init
{
	self= [super initWithColor:ccc4(0, 0, 0, 180)];
	if (self)
	{
        self.touchEnabled = YES;
        
        _type = GAME_TIP;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *tipbg = [CCSprite spriteWithFile:@"alert_bg.png"];
        tipbg.position = ccp(size.width/2,isPad?size.height/2:240);
        
        [self addChild:tipbg];
        
        // 用图像创建，可以用CCMenuItemImage或者CCSprite（如下），后者的优点在于你可以用同一幅图，仅靠着不同色来达到高亮效果
        CCSprite* normal = [CCSprite spriteWithFile:@"close_button.png"];
        CCSprite* selected = [CCSprite spriteWithFile:@"close_button.png"];
        CCMenuItemSprite* item = [CCMenuItemSprite itemWithNormalSprite:normal selectedSprite:selected
                                                                 target:self selector:@selector(closeTip:)];
        item.position = ccp(isPad?260:128,isPad?150:83-iPhone5offsetHalf);
        
        NSString *text;
        if(_type==GAME_TIP){
            text = @"Game Description: Drag an entire row, column, or swap adjacent whole fruit, the ranks of the three identical fruits to eliminate, you can also use props Oh, play to the characteristics of different props to help you get a high score, I wish you a pleasant game ~";
        }else{
            text = @"Game description: Haidilaoyue mode, swinging the phone or drag turtle catch falling fruit scoring touch the bomb if it returns the main game industry, I wish you a pleasant game ~";
        }
        label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake(isPad?480:240,150) alignment:UITextAlignmentLeft fontName:@"Arial" fontSize:isPad?28:14];
        label.position = ccp(size.width/2, size.height/2-(isPad?30:40)-iPhone5offsetHalf);
        [self addChild:label];
        
        
        // 创建菜单
        CCMenu* menu = [CCMenu menuWithItems:item,nil];
    
        [self addChild:menu];

    }
    return self;
}
             
-(void)setType:(int)type{
    _type = type;
    NSString *text = NULL;
    if(type==GAME_TIP){
        text = @"游Opera Description: Drag an entire row, column, or swap adjacent whole fruit, the ranks of the three identical fruits to eliminate, you can also use props Oh, play to the characteristics of different props to help you get a high score, I wish you a pleasant game ~";
    }else if(type==DROPFRUIT_TIP){
        text = @"Haidilaoyue mode: swing the phone or drag turtle catch falling fruit scoring touch the bomb then you lose ~";
    }
    label.string = text;
}

-(void) closeTip:(id)sender {
    NSLog(@"clost tip it");
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [director runningScene];
//    [scene removeChildByTag:11 cleanup:YES];
    [self removeFromParentAndCleanup:YES];
    
    if(_type==GAME_TIP){
        GameLayer *gameLayer = (GameLayer *)[scene getChildByTag:0];
        [gameLayer playGame:nil];
        [gameLayer startGameLogic];
    }else{
        DropFruitLayer *gameLayer = (DropFruitLayer *)[scene getChildByTag:9];
        [gameLayer startGameLogic];
    }
}
-(void)dealloc{
    [super dealloc];
}
@end
