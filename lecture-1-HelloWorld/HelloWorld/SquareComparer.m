//
//  SquareComparer.m
//  HelloWorld
//
//  Created by Saad Patail on 2/23/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "SquareComparer.h"

@implementation SquareComparer

-(Square *)getBigger:(Square *)s1 and:(Square *)s2
{
    if ([s1 getArea] > [s2 getArea]) {
        return s1;
    }
    
    return s2;
}

@end
