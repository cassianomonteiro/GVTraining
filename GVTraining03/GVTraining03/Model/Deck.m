//
//  Deck.m
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
}

- (Card *)drawCard
{
    return [self drawCardFromTop:NO];
}

- (Card *)drawCardFromTop:(BOOL)fromTop
{
    Card *card;
    NSUInteger cardIndex = 0;
    
    if (!fromTop) {
        // Este método gera um número aleatório entre zero (incluído) e o número dado (excluído).
        cardIndex = arc4random_uniform(self.cards.count);
    }
    
    card = self.cards[cardIndex];
    [self.cards removeObject:card];
    
    return card;
}

@end
