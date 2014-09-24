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
    
    //NSString* s = @"3";
    //int d = [s intValue];
    
    NSString *roomName = [nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int airconValue = [valueLabel0.text intValue];
    NSLog(@"%d", airconValue);
    
    
    int fridgeValue = [valueLabel1.text intValue];
    NSLog(@"%d", fridgeValue);
    int tvValue = [valueLabel2.text intValue];
    NSLog(@"%d", tvValue);
    

    
    
    if ([roomName isEqualToString:@""]){
        
        NSLog(@"invalid");
        UIAlertView *invalidTextAlert = [[UIAlertView alloc] initWithTitle:@"Room Name Error" message:@"A room name must contain some letters!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [invalidTextAlert show];

    }
    
    else{
        NSLog(@"valid");
    
        roomToAdd._name = roomName;
        roomToAdd._aircon = airconValue;
        roomToAdd._fridge = fridgeValue;
        roomToAdd._tv = tvValue;
        

    
        NSLog(@"ROOM TO ADD: %@: Aircon:%d, Fridge:%d, TV:%d", roomToAdd._name, roomToAdd._aircon, roomToAdd._fridge, roomToAdd._tv);
    
        [roomsList.rooms addObject: roomToAdd];
        [self dismissViewControllerAnimated:YES completion:nil];
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
