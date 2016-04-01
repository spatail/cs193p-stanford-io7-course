//
//  LastMatchResult.m
//  Machismo
//
//  Created by Saad Patail on 3/31/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "LastMatchResult.h"
#import "Card.h"

@implementation LastMatchResult

- (NSString *)contents {
    NSMutableString *buffer = [NSMutableString string];
    if (!self.cards) {
        // skip rest
    } else if (!self.penalty && [self.cards count] == 1) {
        [buffer appendString:[[self.cards firstObject] contents]];
    } else if (!self.penalty) {
        [buffer appendString:@"Matched "];
        for (Card *card in self.cards) {
            [buffer appendFormat:@"%@ ", [card contents]];
        }
        [buffer appendFormat:@"for %ld points", self.score];
    } else {
        for (Card *card in self.cards) {
            [buffer appendFormat:@"%@ ", [card contents]];
        }
        [buffer appendFormat:@"don't match! %ld point penalty!", self.score];
    }
    return buffer;
}

- (void)clear {
    self.penalty = NO;
    [self.cards removeAllObjects];
    self.score = 0;
}

@end
