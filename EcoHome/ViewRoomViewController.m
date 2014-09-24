//
//  ViewRoomViewController.m
//  EcoHome
//
//  Created by Hannah Shambrook on 21/05/2014.
//
//

#import "ViewRoomViewController.h"
#import "EditRoomViewController.h"


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



- (void)viewDidLoad{
    roomsList = [Room sharedInstance];
    chosenRoom = [roomsList.rooms objectAtIndex:chosenRoomNumber];
    nameLabel.text = chosenRoom._name;
    
    if (chosenRoom._aircon) {
        airconLabel.textColor = [UIColor blueColor];
        airconValueLabel.textColor = [UIColor blueColor];
        airconValueLabel.text = [[NSString alloc]initWithFormat:@"%d", chosenRoom._aircon];
        NSLog(@"Aircon - %d",chosenRoom._aircon);
    } else {
        airconLabel.textColor = [UIColor grayColor];
        airconValueLabel.textColor = [UIColor grayColor];
        NSLog(@"No Aircon");
    }
    if (chosenRoom._fridge) {
        fridgeLabel.textColor = [UIColor blueColor];
        fridgeValueLabel.textColor = [UIColor blueColor];
        fridgeValueLabel.text = [[NSString alloc]initWithFormat:@"%d", chosenRoom._fridge];
        NSLog(@"Fridge - %d", chosenRoom._fridge);
    }
    else {
        fridgeLabel.textColor = [UIColor grayColor];
        fridgeValueLabel.textColor = [UIColor grayColor];
        NSLog(@"No Fridge");
    }
    if (chosenRoom._tv) {
        tvLabel.textColor = [UIColor blueColor];
        tvValueLabel.textColor = [UIColor blueColor];
        tvValueLabel.text = [[NSString alloc]initWithFormat:@"%d", chosenRoom._tv];
        NSLog(@"TV - %d", chosenRoom._tv);
    } else {
        tvLabel.textColor = [UIColor grayColor];
        tvValueLabel.textColor = [UIColor grayColor];
        NSLog(@"No TV");
    }

}

- (void)viewDidAppear:(BOOL)animated{
    if (![self isBeingPresented]) {
        [self dismissViewControllerAnimated:YES completion:nil];
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
    chosenRoomNumber = roomToView;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [[segue destinationViewController] setChosenRoom:chosenRoomNumber];
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
