//
//  Room.h
//  EcoHome
//
//  Created by Hannah Shambrook on 15/05/2014.
//
//

#import <Foundation/Foundation.h>

@interface Room : NSObject{
    NSMutableArray* rooms;
    
}

+ (id)sharedInstance;
@property(nonatomic, retain) NSMutableArray* rooms;

@end
