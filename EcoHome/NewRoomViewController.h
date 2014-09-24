//
//  NewRoomViewController.h
//  EcoHome
//
//  Created by Hannah Shambrook on 16/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomObject.h"

@interface NewRoomViewController : UIViewController{
    Room *roomsList;
    IBOutlet UITextField *nameField;
    IBOutlet UILabel *valueLabel0;
    IBOutlet UILabel *valueLabel1;
    IBOutlet UILabel *valueLabel2;
    
    RoomObject *roomToAdd;
}



- (IBAction)cancelPressed:(id)sender;

- (IBAction)addNewRoom:(id)sender;

@end
