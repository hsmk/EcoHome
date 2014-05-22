//
//  HouseSettingsViewController.h
//  EcoHome
//
//  Created by Chris on 23/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomObject.h"

@interface HouseSettingsViewController : UIViewController{
    Room *roomList;
    IBOutlet UILabel* totalAirconsLabel;
    IBOutlet UILabel* totalFridgesLabel;
    IBOutlet UILabel* totalTvsLabel;
    IBOutlet UILabel* totalLabel;
    IBOutlet UIImageView* resultImage;
    IBOutlet UILabel* errorLabel;
}

-(IBAction)backPressed:(id)sender;

@end


