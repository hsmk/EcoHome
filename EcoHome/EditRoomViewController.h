//
//  EditRoomViewController.h
//  EcoHome
//
//  Created by Hannah Shambrook on 22/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomObject.h"

@interface EditRoomViewController : UIViewController{
    Room *roomList;
    int chosenRoomNumber;
    RoomObject *chosenRoom;
    IBOutlet UITextField *nameField;
    IBOutlet UISwitch *tvSwitch;
    IBOutlet UISwitch *airconSwitch;
    IBOutlet UISwitch *fridgeSwitch;
}

-(IBAction)savePressed:(id)sender;
-(IBAction)cancelPressed:(id)sender;
-(IBAction)deletePressed:(id)sender;
-(void)setChosenRoom:(int)roomToEdit;

@end
