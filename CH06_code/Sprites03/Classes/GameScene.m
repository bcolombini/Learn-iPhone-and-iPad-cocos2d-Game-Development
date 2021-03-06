//
//  GameScene.m
//  SpriteBatches
//
//  Created by Steffen Itterheim on 04.08.10.
//  Copyright 2010 Steffen Itterheim. All rights reserved.
//

#import "GameScene.h"
#import "Ship.h"

@interface GameScene (PrivateMethods)
-(void) countBullets:(ccTime)delta;
@end

@implementation GameScene

static GameScene* instanceOfGameScene;
+(GameScene*) sharedGameScene
{
	NSAssert(instanceOfGameScene != nil, @"GameScene instance not yet initialized!");
	return instanceOfGameScene;
}

+(id) scene
{
	CCScene *scene = [CCScene node];
	GameScene *layer = [GameScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
	{
		instanceOfGameScene = self;
		
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		CCColorLayer* colorLayer = [CCColorLayer layerWithColor:ccc4(255, 255, 255, 255)];
		[self addChild:colorLayer z:-1];
		
		CCSprite* background = [CCSprite spriteWithFile:@"background.png"];
		background.position = CGPointMake(screenSize.width / 2, screenSize.height / 2);
		[self addChild:background];
		
		Ship* ship = [Ship ship];
		ship.position = CGPointMake(ship.texture.contentSize.width / 2, screenSize.height / 2);
		[self addChild:ship];
		
		CCSpriteBatchNode* batch = [CCSpriteBatchNode batchNodeWithFile:@"bullet.png"];
		[self addChild:batch z:1 tag:GameSceneNodeTagBulletSpriteBatch];
		
		[self schedule:@selector(countBullets:) interval:3];
	}
	return self;
}

-(void) dealloc
{
	instanceOfGameScene = nil;
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(CCSpriteBatchNode*) bulletSpriteBatch
{
	CCNode* node = [self getChildByTag:GameSceneNodeTagBulletSpriteBatch];
	NSAssert([node isKindOfClass:[CCSpriteBatchNode class]], @"not a CCSpriteBatchNode");
	return (CCSpriteBatchNode*)node;
}

-(void) countBullets:(ccTime)delta
{
	CCLOG(@"Number of active Bullets: %i", [self.bulletSpriteBatch.children count]);
}

@end
