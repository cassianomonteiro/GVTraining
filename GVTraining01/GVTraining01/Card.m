//
//  Card.m
//  GVTraining01
//
//  Created by Cassiano Monteiro on 23/05/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "Card.h"

// Declarações privadas de propriedades e métodos vão no @interface do arquivo .m (implementação)
@interface Card()
@property (nonatomic, strong) NSString *myPrivateProperty;

+ (void)myPrivateMethod;

@end

@implementation Card

#pragma mark - Exemplo de getter/setter

/**
 * O identificador @synthesize direciona getter/setter para uma variável privada.
 * Só é necessário caso queira modificar o getter, ou ainda apontar para uma variável diferente
 * da convenção com underline.
 */
@synthesize face = _face;

/**
 * Getter (repare que não há "get")
 * Necessário somente quando se deseja modificar a implementação do getter.
 */
- (NSString *)face
{
    return _face;
}

/**
 * Setter (repare na declaração do parâmetro)
 * Necessário somente quando se deseja modificar a implementação do setter.
 */
- (void)setFace:(NSString *)face
{
    _face = face;
}

/**
 * Método de instância (identificado com o sinal de menos "-" antes do retorno)
 */
- (void)shuffleCard
{
    // "self" refere-se à esta própria instância da classe (similar ao "this" em java).
    // "self.face =" está chamando o setter da propriedade face.
    self.face = @"Às de copas";
}

/**
 * Método de classe (estático), identificado com o sinal de mais "+" antes do retorno
 */
+ (void)myPrivateMethod
{
    NSLog(@"Este comando imprime algo no console de debug");
}

@end
