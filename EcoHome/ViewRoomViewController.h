//
//  ViewRoomViewController.h
//  EcoHome
//
//  Created by Hannah Shambrook on 21/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomObject.h"

@interface ViewRoomViewController : UIViewController{

    Room *roomsList;
    int chosenRoomNumber;
    RoomObject *chosenRoom;
    
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *airconLabel;
    IBOutlet UILabel *fridgeLabel;
    IBOutlet UILabel *tvLabel;

}


- (IBAction)cancelPressed:(id)sender;

- (void)setChosenRoom:(int)roomToView;

@end
