//
//  DrawingView.m
//  EcoHome
//
//  Created by Hannah Shambrook on 9/05/2014.
//
//

#import "DrawingView.h"

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    printf("Touches Began!");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    printf("x: %.2f y: %.2f", location.x, location.y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    printf("Touches Moved!");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    printf("x: %.2f y: %.2f", location.x, location.y);
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    printf("Touches Ended!");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    printf("x: %.2f y: %.2f", location.x, location.y);
    
}
- (void)drawRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, red);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 5.0f, 200.0f);
    CGContextAddLineToPoint(c, 200.0f, 300.0f);
    CGContextStrokePath(c);
}


@end
