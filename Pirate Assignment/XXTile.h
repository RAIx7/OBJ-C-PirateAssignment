//
//  XXTile.h
//  Pirate Assignment
//
//  Created by Sanjay Rai on 21/09/2014.
//
//

#import <Foundation/Foundation.h>
#import "XXWeapon.h"
#import "XXArmor.h"

@interface XXTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backGroundImage;
@property (strong, nonatomic) NSString *actionButtonName;





//In order to add Weapons, Armor and health effects to our story we need to update our tile objects. Encapsulating the data in our Tile Class means that tile object will have properties of Weapon, Armor and/or a Health effect. When our user presses the action button we can determine from our current tile what effect should be applied to the character. We will use these properties to update the armor, weapon or simply changing the character'health.
//
//We need to update the Tile Model's header file to include these new properties. Don't forget to import both the Weapon and Armor classes since we'll be creating properties with these classes
@property (strong, nonatomic) XXWeapon *weapon;
@property (strong, nonatomic) XXArmor *armor;

@property (nonatomic) int healthEffect;





@end
