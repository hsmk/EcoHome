//
//  Room.m
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import "Room.h"

@implementation Room

@synthesize rooms;

static Room *sharedInstance = nil;

+ (Room *) sharedInstance {
    if(sharedInstance == nil){
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

- (id) init{
    self = [super init];
    if (self){
        rooms = [[NSMutableArray alloc] init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

-(id)copyWithZone:(NSZone *)zone {
    return self;
}


@end
