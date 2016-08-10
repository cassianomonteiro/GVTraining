//
//  Card.m
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSUInteger)matchCard:(Card *)card
{
    NSUInteger score = 0;
    
    // isEqualToString: compara o conteúdo das strings.
    // Poderia ser utilizado apenas isEqual:, pois isEqual: compara qualquer classe (é um método do NSObject).
    // Não utilizar ==, pois isso compararia os ponteiros.
    if ([self.contents isEqualToString:card.contents]) {
        score = 1;
    }
    
    return score;
}

- (NSUInteger)matchCards:(NSArray<Card *> *)cards
{
    NSUInteger totalScore = 0;
    
    for (Card *card in cards) {
        totalScore += [self matchCard:card];
    }
    
    return totalScore;
}

#pragma mark <NSCopying>

// Para o protocolo <NSCopying>, necessário implementar este método.
// Deve ser alocado um novo objeto, e cada propriedade deve ser copiada individualmente.
- (id)copyWithZone:(NSZone *)zone
{
    Card *copyCard = [[Card allocWithZone:zone] init];
    copyCard.contents = self.contents;
    return copyCard;
}

@end
