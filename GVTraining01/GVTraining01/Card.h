//
//  Card.h
//  GVTraining01
//
//  Created by Cassiano Monteiro on 23/05/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <Foundation/Foundation.h>

// Declarações públicas de propriedades e métodos vão no @interface do arquivo .h (header)
// NSObject é o objeto padrão do qual todos herdam.
@interface Card : NSObject

// atomic = thread-safe
// nonatomic = não é thread-safe
// Tomar cuidado: o padrão é atomic!

// No iOS, a gestão de memória é feita com ARC (Automatic release count)
// A cada ponteiro criado para uma instância de memória, um contador é incrementado.
// A cada ponteiro eliminado, este contador é decrementado.
// Quando o contador chega a zero, a memória é liberada.

// strong = incrementar contador
// weak = não incrementa o contador!
// Quando dois objetos possuem ponteiros entre si, é interessante que um deles seja weak,
// caso contrário acontece um RETAIN-CYCLE, e a memória nunca será desalocada.


@property (nonatomic, strong) NSString *face;

// Variáveis primitivas são sempre "assign", pois não são ponteiros.
@property (nonatomic, assign) BOOL turnedDown;

// Método público
- (void)shuffleCard;

@end
