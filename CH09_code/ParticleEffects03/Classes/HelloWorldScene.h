//
//  HelloWorldLayer.h
//  ParticleEffects
//
//  Created by Steffen Itterheim on 23.08.10.
//  Copyright Steffen Itterheim 2010. All rights reserved.
//

#import "cocos2d.h"

typedef enum
{
	ParticleTypeDesignedFX = 0,
	ParticleTypeDesignedFX2,
	ParticleTypeDesignedFX3,
	ParticleTypeSelfMade,
	
	ParticleTypes_MAX,
} ParticleTypes;

@interface HelloWorld : CCLayer
{
	CCLabel* label;
	ParticleTypes particleType;
	bool touchesMoved;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
