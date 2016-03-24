//
//  PlayingCard.m
//  CardGame
//
//  Created by Saad Patail on 2/24/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validRanks
{
    return @[@"?", @"Ace", @"2", @"3",
             @"4", @"5", @"6", @"7",
             @"8", @"9", @"10",
             @"Jack", @"Queen", @"King"];
}

+ (NSArray *)validSuits
{
    return @[@"Clubs", @"Diamonds", @"Hearts", @"Spades"];
}

+ (NSUInteger)maxRank
{
    return [[PlayingCard validRanks] count] - 1;
}


- (NSString *)contents
{
    return [NSString stringWithFormat:@"%@ of %@", PlayingCard.validRanks[self.rank], self.suit];
//    return [self.rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([PlayingCard.validSuits containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : PlayingCard.validSuits[0];
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
