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
    BOOL _aircon;
    BOOL _fridge;
    BOOL _tv;
    
}

@property(nonatomic, retain) NSString* _name;
@property(nonatomic) BOOL _aircon;
@property(nonatomic) BOOL _fridge;
@property(nonatomic) BOOL _tv;

@end
