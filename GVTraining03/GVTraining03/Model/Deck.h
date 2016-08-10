//
//  Deck.h
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

// NSArray é um objeto, e não um array primitivo. Ele gerencia o array primitivo internamente.
// NSArray é imutável (não é permitido alterar a composição do array).
// Para alterar o conteúdo de um array, usa-se NSMutableArray (que herda de NSArray).
@property (nonatomic, strong) NSMutableArray<Card *> *cards;

/**
 * Documentação pode ser feita do mesmo jeito que Javadoc.<br>
 * Também é possível utilizar tags HTML.
 */
- (void)addCard:(Card *)card;

// O nome deste método é "addCard:atTop:", e ele recebe dois parâmetros (card e atTop).
// Não é overload do método anterior (addCard:), pois o nome dos métodos são diferentes.
// Não é permitido overload em Objective-C.
- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawCard;
- (Card *)drawCardFromTop:(BOOL)fromTop;

@end
