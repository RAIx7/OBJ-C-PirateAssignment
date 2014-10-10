//
//  XXViewController.h
//  Pirate Assignment
//
//  Created by Sanjay Rai on 20/09/2014.
//
//

#import <UIKit/UIKit.h>
#import "XXCharacter.h"
#import "XXBoss.h"

@interface XXViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@property (strong, nonatomic) IBOutlet UILabel *healthStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;


- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;

@property (strong, nonatomic) XXCharacter *character;
@property (strong, nonatomic) XXBoss *boss;






@end
