//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Saad Patail on 2/24/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
                NSLog(@"Added card: '%@'", [card contents]);
            }
        }
    }
    
    return self;
}

@end
