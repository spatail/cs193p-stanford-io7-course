//
//  main.m
//  HelloWorld
//
//  Created by Saad Patail on 2/22/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"
#import "SquareComparer.h"
#import "Circle.h"
#import "Cat.h"

NSString *name = @"Jack";
extern const int count;
const int count = 5;

#define COUNT 5 + 2

void someFunction(NSString *name, int age) {
    NSLog(@"%@ is %i years old", name, age);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, %s!", argv[1]);
        
        NSString *name = @"Joe";
        
        {
            NSString *name = @"John";
            NSLog(@"Your name is %@", name);
        }
        
        NSLog(@"(1 == 5) is %i", (1 == 5));
        
        NSLog(@"Constant count is %i", count);
        
        NSLog(@"Macro #define is %i", COUNT);
        
        Square *square = [[Square alloc] initWithSize:8];
        Square *square2 = [[Square alloc] initWithSize:12];
        
        SquareComparer *comparer = [[SquareComparer alloc] init];
        Square *bigger = [comparer getBigger:square and: square2];
        
        bigger.color = BLUE;
        
        int x = square.size;
//        [square setSize: 5];
        
        NSLog(@"Square's side is %i", x);
        NSLog(@"Area is %i", [square getArea]);
        NSLog(@"Bigger square has size %i", bigger.size);
        NSLog(@"Bigger has color %@", [bigger printColor]);
        
        
        for (int i = 1; i <= 10; i++) {
            Square *sq = [[Square alloc] initWithSize:i];
            NSLog(@"The area is %i", [sq getArea]);
        }
        
        int i = 11;
        while (i <= 20) {
            if (i == 15)
                break;

            Square *sq = [[Square alloc] initWithSize:i];
            NSLog(@"The area is %i", [sq getArea]);
            i++;
        }
        
        @try {
            Square *invalid = [[Square alloc] initWithSize:-1];
        }
        @catch (NSException *exception) {
            NSLog(@"Error was %@", [exception description]);
        }
        @finally {
            NSLog(@"Done");
        }
        
        //////////////////////////
        Square *sq = [[Square alloc] init];
        sq.color = GREEN;
        
        Circle *c = [[Circle alloc] init];
        c.color = RED;
        
        //
        NSLog(@"Square is %@, Cirlce is %@", [sq printColor], [c printColor]);
        
        [c setRadius:4];
        NSLog(@"Circle's area is %i", [c getArea]);
        
        // polymorphism
        id object = sq;
        NSLog(@"The area is object is %i", [object getArea]);
        
        object = c;
        NSLog(@"The area is object is %i", [object getArea]);
        
        // dynamic methods
        NSArray *things = @[c, [[Cat alloc] init]];
        for (id thing in things) {
            [thing toString];
        }
        
        someFunction(@"Saad Patail", 33);

    }
    return 0;
}
