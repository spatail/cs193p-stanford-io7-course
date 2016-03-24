//
//  Shape.h
//  HelloWorld
//
//  Created by Saad Patail on 2/23/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#define RED 1
#define BLUE 2
#define GREEN 3

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property int color;

-(int)getArea;
-(NSString *)printColor;
-(void) toString;

@end
