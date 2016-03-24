//
//  Square.m
//  HelloWorld
//
//  Created by Saad Patail on 2/22/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "Square.h"

@implementation Square

@synthesize size;

-(id)initWithSize:(int)s
{
    if (s <= 0) {
        @throw [NSException exceptionWithName:@"Invalid size" reason:@"Size was not a positive number" userInfo:nil];
    }
    
    self = [super init];
    if (self)
    {
        [self setSize:s];
    }
    return self;
}

//-(void)setSize:(int)s
//{
//    size = s;
//}

-(int)getArea
{
    return size * size;
}

@end
