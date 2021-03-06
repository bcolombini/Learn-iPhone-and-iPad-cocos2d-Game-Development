//
//  Ship.m
//  SpriteBatches
//
//  Created by Steffen Itterheim on 04.08.10.
//  Copyright 2010 Steffen Itterheim. All rights reserved.
//

#import "Ship.h"
#import "Bullet.h"
#import "GameScene.h"

#import "CCAnimationHelper.h"

@interface Ship (PrivateMethods)
-(id) initWithShipImage;
@end


@implementation Ship

+(id) ship
{
	return [[[self alloc] initWithShipImage] autorelease];
}

-(id) initWithShipImage
{
	// Loading the Ship's sprite using a sprite frame name (eg the filename)
	if ((self = [super initWithSpriteFrameName:@"ship.png"]))
	{
		// create an animation object from all the sprite animation frames
		CCAnimation* anim = [CCAnimation animationWithFrame:@"ship-anim" frameCount:5 delay:0.08f];
		
		// add the animation to the sprite (optional)
		//[self addAnimation:anim];
		
		// run the animation by using the CCAnimate action
		CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
		CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
		[self runAction:repeat];
	}
	return self;
}

-(void) dealloc
{
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

// override setPosition to keep ship within bounds
-(void) setPosition:(CGPoint)pos
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	float halfWidth = contentSize_.width * 0.5f;
	float halfHeight = contentSize_.height * 0.5f;

	// Cap the position so the Ship's sprite stays on the screen
	if (pos.x < halfWidth)
	{
		pos.x = halfWidth;
	}
	else if (pos.x > (screenSize.width - halfWidth))
	{
		pos.x = screenSize.width - halfWidth;
	}
	
	if (pos.y < halfHeight)
	{
		pos.y = halfHeight;
	}
	else if (pos.y > (screenSize.height - halfHeight))
	{
		pos.y = screenSize.height - halfHeight;
	}
	
	// must call super with the new position
	[super setPosition:pos];
}


@end
