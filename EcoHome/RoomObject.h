//
//  RoomObject.h
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import <Foundation/Foundation.h>

@interface RoomObject : NSObject{
    
    
    NSString* _name;
    int _aircon;
    int _fridge;
    int _tv;
    
}

@property(nonatomic, retain) NSString* _name;
@property(nonatomic) int _aircon;
@property(nonatomic) int _fridge;
@property(nonatomic) int _tv;

@end
