//
//  RoomTableViewController.h
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomObject.h"

@interface RoomTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    Room *roomsList;
    
    
    int roomToView;
}

@end
