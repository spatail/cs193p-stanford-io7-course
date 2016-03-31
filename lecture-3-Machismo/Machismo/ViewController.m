//
//  ViewController.m
//  Machismo
//
//  Created by Saad Patail on 2/25/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic, getter=isStarted) BOOL started;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *matchMode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CardMatchingGame *)game {
    if (!_game)  _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                           usingDeck:[self createDeck]
                                                      withMatchLimit:self.matchMode.selectedSegmentIndex == 0 ? 2 : 3];
    return _game;
}

- (Deck *)deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if (!self.isStarted) {
        self.matchMode.enabled = NO;
        self.started = YES;
    }
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    NSLog(@"Score: %ld", self.game.score);
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents: @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (IBAction)resetGame:(UIButton *)sender {
    [self.game resetCards];
    [self updateUI];
    self.game = nil;
    self.matchMode.enabled = YES;
    self.started = NO;
}

@end
