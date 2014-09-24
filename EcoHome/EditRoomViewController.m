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
    valueLabel0.text = [[NSString alloc]initWithFormat: @"%d", chosenRoom._aircon];
    valueLabel1.text = [[NSString alloc]initWithFormat: @"%d", chosenRoom._fridge];
    valueLabel2.text = [[NSString alloc]initWithFormat: @"%d", chosenRoom._tv];
    stepper0.value = chosenRoom._aircon;
    stepper1.value = chosenRoom._fridge;
    stepper2.value = chosenRoom._tv;
}

-(void)setChosenRoom:(int)roomToEdit{
    chosenRoomNumber = roomToEdit;
}




-(IBAction)savePressed:(id)sender{
    NSString *roomName = [nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    int airconValue = [valueLabel0.text intValue];
    NSLog(@"aircon %d", airconValue);
    int fridgeValue = [valueLabel1.text intValue];
    NSLog(@"fridge %d", fridgeValue);
    int tvValue = [valueLabel2.text intValue];
    NSLog(@"tv %d", tvValue);
    
    
    
    
    if ([roomName isEqualToString:@""]){
        
        NSLog(@"invalid");
        UIAlertView *invalidTextAlert = [[UIAlertView alloc] initWithTitle:@"Room Name Error" message:@"A room name must contain some letters!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [invalidTextAlert show];
        
    }
    
    else{
        NSLog(@"valid");
        chosenRoom._name = roomName;
        chosenRoom._aircon = airconValue;
        chosenRoom._fridge = fridgeValue;
        chosenRoom._tv = tvValue;
        
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

-(IBAction)labelValueChanged:(UIStepper*)sender {
    NSLog(@"tag:%ld", (long)[sender tag]);
    
    
    switch ([sender tag]) {
        case 0:
            valueLabel0.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[(UIStepper *)sender value]]];
            break;
            
        case 1:
            valueLabel1.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[(UIStepper *)sender value]]];
            break;
            
        case 2:
            valueLabel2.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[(UIStepper *)sender value]]];
            break;
            
        default:
            break;
        
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
