//
//  main.m
//  CardGame
//
//  Created by Saad Patail on 2/24/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

@import Foundation;

#import "Deck.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
        [deck printDeck];
        NSLog(@"Random card pick is '%@'", [[deck drawRandomCard] contents]);
    }
    return 0;
}
