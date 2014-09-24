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

@interface EditRoomViewController : UIViewController <UIAlertViewDelegate>{
    Room *roomList;
    int chosenRoomNumber;
    RoomObject *chosenRoom;
    IBOutlet UITextField *nameField;
    
    IBOutlet UIStepper *stepper0;
    IBOutlet UIStepper *stepper1;
    IBOutlet UIStepper *stepper2;
    
    IBOutlet UILabel *valueLabel0;
    IBOutlet UILabel *valueLabel1;
    IBOutlet UILabel *valueLabel2;
}

-(IBAction)savePressed:(id)sender;
-(IBAction)cancelPressed:(id)sender;
-(IBAction)deletePressed:(id)sender;
-(void)setChosenRoom:(int)roomToEdit;

@end
