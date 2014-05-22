//
//  EditRoomViewController.m
//  EcoHome
//
//  Created by Hannah Shambrook on 22/05/2014.
//
//

#import "EditRoomViewController.h"

@interface EditRoomViewController ()

@end

@implementation EditRoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)cancelPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    roomList =[Room sharedInstance];
    
    
    chosenRoom = [roomList.rooms objectAtIndex:chosenRoomNumber];
    nameField.text = chosenRoom._name;
    

    
    if (chosenRoom._aircon) {
        [airconSwitch setOn:YES animated:YES];
    }
    else{
        [airconSwitch setOn:NO animated:YES];
    }
    if (chosenRoom._tv) {
        [tvSwitch setOn:YES animated:YES];
    }
    else{
        [tvSwitch setOn:NO animated:YES];
    }
    if (chosenRoom._fridge) {
        [fridgeSwitch setOn:YES animated:YES];
    }
    else{
        [fridgeSwitch setOn:NO animated:YES];
    }
}

-(void)setChosenRoom:(int)roomToEdit{
    chosenRoomNumber = roomToEdit;
}

-(IBAction)savePressed:(id)sender{
    NSString *roomName = [nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([roomName isEqualToString:@""]){
        
        NSLog(@"invalid");
        UIAlertView *invalidTextAlert = [[UIAlertView alloc] initWithTitle:@"Room Name Error" message:@"A room name must contain some letters!" delegate:self cancelButtonTitle:@"GOTCHA!" otherButtonTitles: nil];
        [invalidTextAlert show];
        
    }
    
    else{
        NSLog(@"valid");
        
        chosenRoom._name = roomName;
        
        if([airconSwitch isOn]){
            chosenRoom._aircon = YES;
        }else{
            chosenRoom._aircon = NO;
        }
        
        if([fridgeSwitch isOn]){
            chosenRoom._fridge = YES;
        }else{
            chosenRoom._fridge = NO;
        }
        
        if([tvSwitch isOn]){
            chosenRoom._tv = YES;
        }else{
            chosenRoom._tv = NO;
        }

        
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    

}

-(IBAction)deletePressed:(id)sender{
    
    UIAlertView *deleteAlert = [[UIAlertView alloc] initWithTitle:@"Deleting Room" message:@"Are you sure you want to send this room into the nether?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    
    [deleteAlert show];
    
    if (deleteAlert.cancelButtonIndex) {
        NSLog(@"Cancel");
    }
    else{
        NSLog(@"Deleting room");
        [roomList.rooms removeObject:chosenRoom];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
