//
//  PokerDeck.m
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "PokerDeck.h"
#import "PokerCard.h"

@implementation PokerDeck

// Override do construtor padrão para inicializar o deck.
// Reparar que a classe pai (Deck) não inicializa o array de cartas. Isso não dará crash no app, mas não acontecerá nada.
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.cards = [NSMutableArray arrayWithCapacity:(([PokerCard validRanks].count-1) * [PokerCard validSuits].count)];
        
        for (NSString *suit in [PokerCard validSuits]) {
            
            for (NSUInteger i = 1; i < [PokerCard validRanks].count; i++) {
                PokerCard *card = [[PokerCard alloc] init];
                card.rank = i;
                card.suit = suit;
                [self.cards addObject:card];
            }
        }
        
    }
    
    return self;
}

@end
