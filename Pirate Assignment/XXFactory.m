//
//  XXFactory.m
//  Pirate Assignment
//
//  Created by Sanjay Rai on 21/09/2014.
//
//

#import "XXFactory.h"
#import "XXTile.h"


//We will be using a factory to create our tile objects. There are a variety of reasons to create a factory but in laymans terms it lets us keep the tile creation in another class outside of the ViewController. In short our VIewController will have less code and will be free to do its' primary task of managing the view.

//To represent the 12 tiles that will make up our game I create 12 tile objects. For now we'll leave the background image and the actionButton's name blank. However, to allow us to test and make sure that our tiles are updating we will use a default story with its' tile number. We will group the tiles into containers or arrays. Each container will serve as a column in our coordinate system. We can group all of these containers together so that the number of containers we add to our array will be equal to the number of columns in our coordinate system.

//We also use a little shorthand here for our final array. Instead of creating an NSMutableArray and adding objects after the fact, we create an NSArray and initalize it with objects. The method initWithObjects: is a custom initializer that allows us to create the tiles array with all of the containers. We can then return this tiles array from our method. Now when we create an instance of CCFactory and call the method tiles on that instance we get an array of containers back.

@implementation XXFactory


//Because this method returns a value we use keyword "return at the bottom"
-(NSArray *)tiles
{
    
    XXTile *tile1 = [[XXTile alloc] init];
    tile1.story = @"Captain Jack Sparrow, we need a fearless leader such as yourself to undertake a voage and defeat the evil pirate Boss. Please, take the blunted sword and find him!!";
    tile1.backGroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    XXWeapon *bluntedSword = [[XXWeapon alloc] init];
    bluntedSword.weaponName = @"Blunted Sword";
    bluntedSword.weaponDamage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the Blunted Sword";
    
    XXTile *tile2 = [[XXTile alloc] init];
    tile2.story = @"Jack, you have come across an abandoned ship which has an amrmory, would you like to take some armor?";
    tile2.backGroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    XXArmor *swatVestArmor = [[XXArmor alloc] init];
    swatVestArmor.armorName = @"Swat Vest Armor";
    swatVestArmor.armorHealth = 10;
    tile2.armor = swatVestArmor;
    tile2.actionButtonName = @"Pick up the Armor";
    
    XXTile *tile3 = [[XXTile alloc] init];
    tile3.story = @"Captain, a mysterious dock has appeared on the horizon.. should we investigate and ask for directions?";
    tile3.backGroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 5;
    tile3.actionButtonName = @"Pull up at the dock";
    
    NSArray *firstColumn = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    XXTile *tile4 = [[XXTile alloc] init];
    tile4.story = @"You have found a parrot!! Parrots can be used in your armor slot as they are great defenders and loyal to their captains!";
    tile4.backGroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    XXArmor *parrotArmor = [[XXArmor alloc] init];
    parrotArmor.armorName = @"Parrot";
    parrotArmor.armorHealth = 10;
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Adopt the parrot!!";
    
    XXTile *tile5 = [[XXTile alloc] init];
    tile5.story = @"Captain, you have stumbled upon a cache of weapons, take them in order to increase you firepower for when we meet the evil pirate BOSS!!!!";
    tile5.backGroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    XXWeapon *pistolWepon = [[XXWeapon alloc] init];
    pistolWepon.weaponName = @"Pistol";
    pistolWepon.weaponDamage = 17;
    tile5.weapon = pistolWepon;
    tile5.actionButtonName = @"Load up the pistol and take it";
    
    XXTile *tile6 = [[XXTile alloc] init];
    tile6.story = @"BANG, you have been captured by pirates and are ordered to walk the plank!!!!!!!";
    tile6.backGroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -19;
    tile6.actionButtonName = @"Walk the plank";
    
    NSArray *secondColumn = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];

    XXTile *tile7 = [[XXTile alloc] init];
    tile7.story = @"You sight a pirate battle of the coast, should we takeover? ";
    tile7.backGroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 10;
    tile7.actionButtonName = @"Intervene the fight!!!";
    
    XXTile *tile8 = [[XXTile alloc] init];
    tile8.story = @"POW!! The legend of the deep blue sea has arrisen, the mighty Kraken appears prepare to take damage!!";
    tile8.backGroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -39;
    tile8.actionButtonName = @"ABANDON SHIPP";
    
    XXTile *tile9 = [[XXTile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of treasure!";
    tile9.backGroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    XXWeapon *Katana = [[XXWeapon alloc] init];
    Katana.weaponName = @"Katana";
    Katana.weaponDamage = 20;
    tile9.healthEffect = 5;
    tile9.weapon = Katana;
    tile9.actionButtonName = @"Take the treasure!";
    
    NSArray *thirdColumn = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    XXTile *tile10 = [[XXTile alloc] init];
    tile10.story = @"CAPTAIN, There are pirates from the north attempting to overboard our ship!";
    tile10.backGroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -5;
    tile10.actionButtonName = @"Fight the invaders";
    
    XXTile *tile11 = [[XXTile alloc] init];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backGroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = 9;
    tile11.actionButtonName = @"Swim deep";
    
    
    XXTile *tile12 = [[XXTile alloc] init];
    tile12.story = @"JACK!! HES HERE!! Get ready to take on the disgusting evil pirate boss!!!!!!!!!!!";
    tile12.backGroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"TAKE ON THE PIRATE BOSS";
    
    NSArray *fourthColumn = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;

}


-(XXCharacter *)character
{
    XXCharacter *character = [[XXCharacter alloc] init];
    character.health = 100;
    
    XXArmor *armor = [[XXArmor alloc] init];
    armor.armorName = @"Cloak";
    armor.armorHealth = 5;
    character.armor = armor;
    
    
    XXWeapon *weapon = [[XXWeapon alloc] init];
    weapon.weaponDamage = 10;
    weapon.weaponName = @"Fists of fury";
    character.weapon = weapon;
    return character;
    
}


-(XXBoss *)boss
{
    XXBoss *boss = [[XXBoss alloc] init];
    boss.health = 80;
    return boss;
    
}








@end
