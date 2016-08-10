//
//  ConcentrationGame.m
//  GVTraining03
//
//  Created by Cassiano Monteiro on 10/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "ConcentrationGame.h"

@interface ConcentrationGame()

@property (nonatomic, strong) NSMutableArray<Card *> *cards;
@property (nonatomic, strong) NSMutableArray<Card *> *scoredCards;
@property (nonatomic, strong) Card *firstCard;
@property (nonatomic, strong) NSNumber *score;
@end

@implementation ConcentrationGame

- (instancetype)initWithCardsCount:(NSUInteger)cardsCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        
        self.score = @0;
        self.scoredCards = [NSMutableArray arrayWithCapacity:cardsCount];
        self.cards = [NSMutableArray arrayWithCapacity:cardsCount];
        
        for (NSUInteger i = 0; i < (cardsCount/2); i++) {
            Card *card = [deck drawCard];
            [self.cards addObject:card];
            
            // Adicionamos uma cópia para que sejam instâncias diferentes na memória.
            [self.cards addObject:[card copy]];
        }
        
    }
    return self;
}

- (void)pickCard:(Card *)card
{
    if (!self.firstCard) {
        self.firstCard = card;
        [self.delegate showCard:card];
    }
    else {
        
        [self.delegate showCard:card];
        
        NSInteger score = [self.firstCard matchCard:card];
        self.score = @(self.score.integerValue + score);
        
        if (score > 0) {
            [self.scoredCards addObject:card];
            [self.scoredCards addObject:self.firstCard];
        }
        else {
            [self.delegate hideCard:card];
            [self.delegate hideCard:self.firstCard];
        }
        
        [self.delegate showScore:self.score];
        self.firstCard = nil;
    }
}

- (BOOL)shouldPickCard:(Card *)card
{
    return ![self.scoredCards containsObject:card];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return [self.cards objectAtIndex:index];
}

- (NSUInteger)indexOfCard:(Card *)card
{
    return [self.cards indexOfObject:card];
}

@end
