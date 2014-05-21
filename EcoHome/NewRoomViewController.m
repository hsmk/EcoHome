//
//  NewRoomViewController.m
//  EcoHome
//
//  Created by Hannah Shambrook on 16/05/2014.
//
//

#import "NewRoomViewController.h"

@interface NewRoomViewController ()

@end

@implementation NewRoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    roomsList = [Room sharedInstance];
    roomToAdd = [[RoomObject alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelPressed:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



-(IBAction)addNewRoom:(id)sender{
    
    
    NSString *roomName = [nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    
    if ([roomName isEqualToString:@""]){
        
        NSLog(@"invalid");
        UIAlertView *invalidTextAlert = [[UIAlertView alloc] initWithTitle:@"Room Name Error" message:@"A room name must contain some letters!" delegate:self cancelButtonTitle:@"GOTCHA!" otherButtonTitles: nil];
        [invalidTextAlert show];

    }
    
    else{
        NSLog(@"valid");
    
        roomToAdd._name = roomName;
    
        if([airconSwitch isOn]){
            roomToAdd._aircon = YES;
        }else{
            roomToAdd._aircon = NO;
        }
    
        if([fridgeSwitch isOn]){
            roomToAdd._fridge = YES;
        }else{
            roomToAdd._fridge = NO;
        }
    
        if([tvSwitch isOn]){
            roomToAdd._tv = YES;
        }else{
            roomToAdd._tv = NO;
        }
    
    
        NSLog(@"ROOM TO ADD: %@: Aircon:%hhd, Fridge:%hhd, TV:%hhd", roomToAdd._name, roomToAdd._aircon, roomToAdd._fridge, roomToAdd._tv);
    
        [roomsList.rooms addObject: roomToAdd];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
