//
//  Shape.m
//  HelloWorld
//
//  Created by Saad Patail on 2/23/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "Shape.h"

@implementation Shape

@synthesize color;

-(NSString *) printColor
{
    switch (color) {
        case RED:
            return @"Red";
        case BLUE:
            return @"Blue";
        case GREEN:
            return @"Green";
        default:
            return @"Unknown";
    }
}

-(int)getArea
{
    return -1;
}

-(void) toString {
    NSLog(@"I am some kind of shape!");
}

@end
