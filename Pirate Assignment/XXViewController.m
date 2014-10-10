//
//  XXViewController.m
//  Pirate Assignment
//
//  Created by Sanjay Rai on 20/09/2014.
//
//

#import "XXViewController.h"
#import "XXFactory.h"
#import "XXTile.h"
@interface XXViewController ()

@end

@implementation XXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XXFactory *factory = [[XXFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    
    self.currentPoint = CGPointMake(0, 0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(UIButton *)sender {
}

- (IBAction)resetButton:(UIButton *)sender {
}
- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    XXTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    
        if (self.character.health <= 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Defeat!!" message:@"You have been defeated!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            
        }
        else if (self.boss.health <= 0){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory!" message:@"You have defeated the pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            
        }
        
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    [self updateTile];
    
}


#pragma mark - IBAction

//If the user pressed a valid navigation button we need to update our current point, valid buttons and the information on our view.
//
//First we update our current point. If we press the north button for example our y point increases by 1. Now that our current point is at a new location we need to update which buttons are valid from this location. Call the method updateButtons to unhide or hide based on need. Finally, we can update our view with the new tile. Since the updateTile method finds the current tile based on the current point it is important that we update our current point before using this functionality.
- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    [self updateButtons];
    [self updateTile];

}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x +1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x -1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    
    [self viewDidLoad];
    
}

#pragma mark - VOID

//This method states that we are calling an object from our array using our self.current point in which the initial value is set to 0 therefore the first tile from our array will be selected
-(void)updateTile
{
    XXTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.myImageView.image = tileModel.backGroundImage;
    
    
    
    self.healthStatLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageStatLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorTypeLabel.text = self.character.armor.armorName;
    self.weaponStatLabel.text = self.character.weapon.weaponName;
    
    
////Now we can apply the changes that we made to our tiles in the last section. A good first step would be to update the actionButton's title. We created both an IBAction and an IBOutlet for our action button. Therefore, we can use our IBOutlet for our action button to update the title of our button. At the end of our updateTile method add the following line of code:
//  In order to update our button's title we use the method setTitle:forState. This method accepts 2 parameters. The first one is an NSString which we set dynamically using our Tile's actionButtonName property. The second argument expects a control state. We will learn about alternative control states in the future. For now use UIControlStateNormal.
    
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
    
    
    
}

//Next we need to create a method called updateButtons. We will test each button to see if it should be hidden or not. The method tileExistsAtPoint returns a BOOL value as to whether or not we should set the hidden property of our buttons to YES or NO. The CGPoint we pass in should test the current point if a tile exists to the North, South, East or West of our current point.
-(void)updateButtons
{
    
    self.westButton.hidden = [self tileExitsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExitsAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExitsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.southButton.hidden = [self tileExitsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];

}

//We need to create two methods. The first method will accept a CGPoint and tell you if a tile exists at that point. The method will return a BOOL which will decide whether or not we should hide the button. If the method returns NO the button should not be hidden. If the button is currently hidden unhide it. If our method returns YES we should hide the button. Our if statement will test to confirm that the CGPoint's x and y values are greater than 0. This will confirm that the tested point does not go below our lower bounds. To test our upper bounds we will confirm that the count of the total number of arrays in our tiles array is greater than our x point. We also need to confirm that for the chosen array inside of our tiles array that its' count is greater than the y point. If all of these conditions are true than the tile exists and we return NO. Otherwise the tile does not exist and we return YES.

-(BOOL)tileExitsAtPoint:(CGPoint)point
{
    if (point.y >=0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }
    else {
        return  YES;
    }
}



//
//Our button's title should now update properly. The next change to our Tile class that we need to implement is the weapon, armor or health effect. Lets create a method that accepts 3 parameters including: armor, weapon and healthEffect. Inside of this method we will use if statements to test if a valid object or number is being passed into our method. If it is, then we adjust our characters attributes appropriately.
//
//Why do we have to test if the object exists. When we updated our Tile object we were not required to add a weapon, armor or health effect. For all of our tiles we simply added one of these. However, we don't want our method to update all of the tile's properties. We only want update character's attributes for the valid property.
//
//We can use nil as a comparision to test if an object exists. It is a pointer to "no object" or nothing at all. In effect, by saying object == nil, we test is the object exists. Since our health effect is an integer we test if it is equal to 0 instead of nil. We only use nil to test if objects exist. Now we add an else statement at the end of our method in the event that everything is nil or 0. This is the case when we first run our application since the user has not pressed the action button. However, we want to setup our character's initial attributes by factoring in the effects of the weapon and armor currently configured for our character

-(void)updateCharacterStatsForArmor:(XXArmor *)armor withWeapons:(XXWeapon *)weapon withHealthEffect:(int)healtheffect
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.armorHealth + armor.armorHealth;
        self.character.armor = armor;
    }
    else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.weaponDamage + weapon.weaponDamage;
        self.character.weapon = weapon;
        
    }
    else if (healtheffect != 0){
        self.character.health = self.character.health + healtheffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.armorHealth;
        self.character.damage = self.character.damage + self.character.weapon.weaponDamage;
        
    }
}





@end
