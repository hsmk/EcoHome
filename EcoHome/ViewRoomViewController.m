//
//  ViewRoomViewController.m
//  EcoHome
//
//  Created by Hannah Shambrook on 21/05/2014.
//
//

#import "ViewRoomViewController.h"


@interface ViewRoomViewController ()

@end

@implementation ViewRoomViewController

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
    
}

- (void)viewWillAppear:(BOOL)animated{
    roomsList = [Room sharedInstance];
    chosenRoom = [roomsList.rooms objectAtIndex:chosenRoomNumber];
    nameLabel.text = chosenRoom._name;
    
    if (chosenRoom._aircon) {
        airconLabel.text = @"Airconditioner: YES";
        NSLog(@"Aircon");
    } else {
        airconLabel.text = @"Airconditioner: NO";
        NSLog(@"No Aircon");
    }
    if (chosenRoom._tv) {
        tvLabel.text = @"Televison: YES";
        NSLog(@"TV");
    } else {
        tvLabel.text = @"Television: NO";
        NSLog(@"No TV");
    }
    if (chosenRoom._fridge) {
        fridgeLabel.text = @"Refridgerator: YES";
        NSLog(@"Fridge");
    }
    else {
        fridgeLabel.text = @"Refridgerator: NO";
        NSLog(@"No Fridge");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelPressed:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)setChosenRoom:(int)roomToView{
    NSLog(@"roomToView: %d", roomToView);
    chosenRoomNumber = roomToView;
    NSLog(@"FUCKYERRRRR CJ0ZEN RUIM: %d", chosenRoomNumber);
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
