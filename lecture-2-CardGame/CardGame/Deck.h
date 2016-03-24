//
//  Deck.h
//  CardGame
//
//  Created by Saad Patail on 2/24/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

@import Foundation;

#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
- (void)printDeck;

@end
