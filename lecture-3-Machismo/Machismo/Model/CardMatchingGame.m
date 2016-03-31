//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Saad Patail on 3/7/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, readwrite) NSInteger cardsToMatch;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withMatchLimit:(NSInteger)limit {
    self = [self initWithCardCount:count usingDeck:deck];
    if (self) {
        self.cardsToMatch = limit;
    }
    return self;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                //self.cards[i] = card; //test if this works
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (instancetype)init {
    return nil;
}

//#define MISMATCHED_PENALTY  2
static const int MISMATCHED_PENALTY = 2; // typed, debugger will show it
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            NSInteger countOtherChosenCards = 0;
            NSMutableArray *otherChosenCards = [[NSMutableArray alloc] init];
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    
                    // cache all cards until we reach the match limit
                    [otherChosenCards addObject:otherCard];
                    if (++countOtherChosenCards < (self.cardsToMatch - 1)) {
                        continue;
                    }
                    
                    // match the current card against previously chosen
                    int matchScore = [card match:otherChosenCards];
                    // match all previously chosen cards against eachother
                    if ([otherChosenCards count] > 1) {
                        for (int i = 0; i < [otherChosenCards count]; i++) {
                            for (int j = i + 1; j < [otherChosenCards count]; j++) {
                                matchScore += [[otherChosenCards objectAtIndex:i] match:@[[otherChosenCards objectAtIndex:j]]];
                            }
                        }
                    }
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        for (Card *other in otherChosenCards) {
                            other.matched = YES;
                        }
                    } else {
                        self.score -= MISMATCHED_PENALTY;
                        for (Card *other in otherChosenCards) {
                            other.chosen = NO;
                        }
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void)resetCards {
    for (Card *card in self.cards) {
        card.matched = NO;
        card.chosen = NO;
    }
    self.score = 0;
}

@end
