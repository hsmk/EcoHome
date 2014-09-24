//
//  HouseSettingsViewController.m
//  EcoHome
//
//  Created by Chris on 23/05/2014.
//
//

#import "HouseSettingsViewController.h"

@interface HouseSettingsViewController ()

@end

@implementation HouseSettingsViewController

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
    roomList = [Room sharedInstance];
    
    if(roomList.rooms.count > 0){
        
        int numAircons = 0;
        int numFridges = 0;
        int numTvs = 0;
        for (RoomObject* room in roomList.rooms) {
            if (room._aircon > 0) {
                numAircons += room._aircon;
            }
            if (room._fridge > 0) {
                numFridges += room._fridge;
            }
            if (room._tv > 0) {
                numTvs += room._tv;
            }
            
            totalAirconsLabel.text = [NSString stringWithFormat:@"%d", numAircons];
            totalFridgesLabel.text = [NSString stringWithFormat:@"%d", numFridges];
            totalTvsLabel.text = [NSString stringWithFormat:@"%d", numTvs];
            
            double totalEnergyUsage = numAircons*10 + numFridges*17.4 + numTvs*1.13;
            totalLabel.text = [NSString stringWithFormat:@"%0.2f", totalEnergyUsage];
            
            if (totalEnergyUsage <= 50) {
                totalLabel.textColor = [UIColor greenColor];
                resultImage.image = [UIImage imageNamed:@"happy.png"];
            } else if (totalEnergyUsage <= 100){
                totalLabel.textColor = [UIColor yellowColor];
                resultImage.image = [UIImage imageNamed:@"neutral.png"];
            } else{
                totalLabel.textColor = [UIColor redColor];
                resultImage.image = [UIImage imageNamed:@"sad.png"];
            }
        }
    }
    else{
        errorLabel.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
