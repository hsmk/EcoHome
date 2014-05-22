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
    [self dismissViewControllerAnimated:NO completion:nil];
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
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Warning" message:@"Are you sure you want to delete this room?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [messageAlert show];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
    }
    else if (buttonIndex == 1){
        [roomList.rooms removeObject:chosenRoom];
        [self dismissViewControllerAnimated:NO completion:nil];
        
        
        
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
