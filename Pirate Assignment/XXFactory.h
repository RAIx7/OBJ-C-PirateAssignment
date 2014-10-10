//
//  XXFactory.h
//  Pirate Assignment
//
//  Created by Sanjay Rai on 21/09/2014.
//
//

#import <Foundation/Foundation.h>
#import "XXCharacter.h"
#import "XXBoss.h"

@interface XXFactory : NSObject

-(NSArray *)tiles;

-(XXCharacter *)character;

-(XXBoss *)boss;




@end
