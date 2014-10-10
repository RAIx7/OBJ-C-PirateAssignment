//
//  XXCharacter.h
//  Pirate Assignment
//
//  Created by Sanjay Rai on 24/09/2014.
//
//

#import <Foundation/Foundation.h>
#import "XXWeapon.h"
#import "XXArmor.h"

@interface XXCharacter : NSObject

@property (strong, nonatomic) XXWeapon *weapon;
@property (strong, nonatomic) XXArmor *armor;

@property (nonatomic) int damage;
@property (nonatomic) int health;





@end
