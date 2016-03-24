//
//  Card.m
//  CardGame
//
//  Created by Saad Patail on 2/24/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(Card *)card
{
    int score = 0;
    
    if ([card.contents isEqualToString:self.contents]) {
        score = 1;
    }
    
    return score;
}

- (int)matchAny:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        int _score = [self match:card];
        if (_score == 1) {
            score = _score;
        }
    }
    return score;
}

@end
