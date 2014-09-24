//
//  RoomObject.m
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import "RoomObject.h"

@implementation RoomObject
@synthesize _name;
@synthesize _aircon;
@synthesize _fridge;
@synthesize _tv;

-(id)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (id) initWithName:(NSString*)name AndAircon:(int)aircon AndFridge:(int)fridge AndTelevision:(int)tv{
    self = [super init];
    if (self) {
        _name = name;
        _aircon = aircon;
        _fridge = fridge;
        _tv = tv;
    }
    return self;
}


@end
