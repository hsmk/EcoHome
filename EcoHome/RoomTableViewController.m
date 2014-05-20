//
//  RoomTableViewController.m
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import "RoomTableViewController.h"
#import "ViewRoomViewController.h"

@interface RoomTableViewController ()

@end

@implementation RoomTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


//-(IBAction)addNewRoom:(id)sender{
//    [roomsList.rooms addObject:[NSString stringWithFormat:@"%@",@"Room"]];
//    NSLog(@"hhhpdios");
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    roomsList = [Room sharedInstance];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

//FOR TEST PRINTING ONLY
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"started");
    for (RoomObject* room in roomsList.rooms) {
        NSLog(@"%@", room);
    }
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"pressed room: %d", indexPath.row);
    //roomToView = indexPath.row;
    //roomToView = 1;
    //[self performSegueWithIdentifier:@"viewingSegue" sender:];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return roomsList.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell* cell = [theTableView dequeueReusableCellWithIdentifier:@"room"];
    
    RoomObject* room = [roomsList.rooms objectAtIndex:indexPath.row];
    
    cell.textLabel.text = room._name;
    
    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:@"viewingSegue"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        roomToView = indexPath.row;
        NSLog(@"roomToView(inPrepForSegue): %d", roomToView);
        [[segue destinationViewController] setChosenRoom: roomToView];
    }
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end