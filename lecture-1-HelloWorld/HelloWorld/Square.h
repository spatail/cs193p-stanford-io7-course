//
//  Square.h
//  HelloWorld
//
//  Created by Saad Patail on 2/22/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Square : Shape {
//    int size;
}

@property int size;


-(id)initWithSize: (int)s;
//-(void)setSize: (int) s;

@end
