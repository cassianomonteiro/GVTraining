//
//  ViewController.m
//  GVTraining06
//
//  Created by Cassiano Monteiro on 22/07/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "ViewController.h"

typedef NSNumber * (^operationBlock)(NSNumber *, NSNumber *);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)buttonTapped:(UIButton *)sender;
@property (nonatomic, strong) NSMutableArray<operationBlock> *operations;
@end

@implementation ViewController

- (IBAction)buttonTapped:(UIButton *)sender
{
    [self runArray];
}

- (void)runDictionary
{
    // Exemplo em que todos os conjuntos chave/valor do dicionário são percorridos executando um bloco de código
    NSDictionary *dic = @{@1:@"um", @2:@"dois", @3:@"três", @4:@"quatro"};
    
    // Aqui é criada uma váriável chamada "enumeratingBlock" do tipo do bloco que queremos executar.
    // O tipo deste bloco é
    // ^ void (id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
    // (o void pode ser omitido)
    void(^enumeratingBlock)(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) = ^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([key isEqual:@1]) {
            // Esta é uma variável de parada, indicando que a enumeração deve parar mesmo que
            // nem todos os conjuntos chave/valor tenham sido percorridos
            // Necessário utilizar o * (ponteiro) porque é uma variável primitiva passada por referência.
            // O escopo desta variável é interna ao dicionário, de forma que é passado o ponteiro dela para que o bloco
            // possa modificá-la externamente, e o dicionário saiba que deve parar a enumeração
            *stop = YES;
        }
        
        NSLog(@"%@ : %@", key, obj);
    };
    
    // Executar a enumeração passando a variável de bloco como parâmetro
    [dic enumerateKeysAndObjectsUsingBlock:enumeratingBlock];
}

- (void)runArray
{
    // Adicionar operações ao array
    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
        return @(obj1.doubleValue + obj2.doubleValue);
    }];
    
    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
        return @(obj1.doubleValue - obj2.doubleValue);
    }];
    
    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
        return @(obj1.doubleValue / obj2.doubleValue);
    }];
    
    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
        return @(obj1.doubleValue * obj2.doubleValue);
    }];

    // Isto causa um retain cycle porque estou adicionando um bloco a um array do meu objeto, criando um ponteiro forte
    // objeto -> array -> bloco, enquanto estou chamando um método do próprio objeto self dentro do bloco,
    // sendo que o bloco está dentro do self (criando um ponteiro forte bloco -> objeto).
    
    // Descomente o código abaixo para ver o warning
//    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
//        return [self averageOfNumber:obj1 andNumber:obj2];
//    }];
    
    // Necessário criar um ponteiro fraco para self, e utilizá-lo dentro do bloco
    ViewController __weak *weakSelf = self;
    [self.operations addObject: ^NSNumber * (NSNumber * obj1, NSNumber * obj2) {
        return [weakSelf averageOfNumber:obj1 andNumber:obj2];
    }];
    
    
    // Imprimir resultados das operações antes de ordenar o array
    for (operationBlock myBlock in self.operations) {
        NSLog(@"%@", myBlock(@10, @5));
    }
    
    // Ordenar o array de operações utilizando um bloco
    // Este método realiza um sort in-place (o próprio array é modificado). Isso só é possível porque é um NSMutableArray
    [self.operations sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        // Obter operações
        operationBlock op1 = obj1;
        operationBlock op2 = obj2;
        
        // Queremos deixar as operações na ordem:
        // + (adição)
        // - (subtração)
        // * (multiplicação)
        // / (divisão)
        // Para isso, vamos executar cada operação com valores conhecidos e comparar com os resultados esperados
        // Valores conhecidos: 12 e 6
        // Resultados esperados:
        // 12 + 6 = 18
        // 12 - 6 = 6
        // 12 * 6 = 72
        // 12 / 6 = 2
        
        // Array de resultados esperados na ordem desejada:
        NSArray<NSNumber *> *results  = @[@18, @6, @72, @2];
        
        // Obter posição no array do resultado de cada operação
        NSInteger position1 = [results indexOfObject:op1(@12, @6)];
        NSInteger position2 = [results indexOfObject:op2(@12, @6)];
        
        // Avaliar a ordenação através das posições obtidas e retornar um NSComparisonResult
//        if (position1 < position2) {
//            return NSOrderedAscending;
//        } else if (position1 > position2) {
//            return NSOrderedDescending;
//        } else {
//            return NSOrderedSame;
//        }
        
        // Isto faz o mesmo que o código comentado acima
        return [@(position1) compare:@(position2)];
    }];
    
    // Imprimir resultados das operações depois de ordenar o array
    // Notar que estamos imprimindo as mesmas operações sendo executadas com outros parâmetros.
    // Ou seja, o que foi ordenado é O CONJUNTO DE OPERAÇÕES, e não os resultados das operações para estes parâmetros
    for (operationBlock myBlock in self.operations) {
        NSLog(@"%@", myBlock(@16, @8));
    }
    
}

// Método deste objeto para ser adicionado no array de operações do objeto
- (NSNumber *)averageOfNumber:(NSNumber *)number andNumber:(NSNumber *)otherNumber
{
    return @((number.doubleValue + otherNumber.doubleValue)/2);
}

- (void)variableWithinBlock
{
    NSString * myString = @"Hello World";
    
    // Necessário utilizar o modificador __block (dois underscores antes da palavra block)
    // para indicar que esta variável pode ser modificada dentro do bloco.
    // Sem o modificador, ela seria read-only
    NSInteger __block counter = 0;
    
    void(^printingBlock)() = ^() {
        // Modificando a variável fora do escopo do bloco
        counter++;
        NSLog(@"%d : %@", counter, myString);
    };

    // Executar o bloco várias vezes para ver a modificação do contador
    for (NSInteger i = 0; i < 3; i++) {
        printingBlock();
    }
}

- (void)selfDentroDoBloco
{
    // Neste bloco, não é necessário uma variável weak porque não é criado um ponteiro objeto -> bloco, e sim apenas
    // bloco -> objeto
    [UIView animateWithDuration:2 animations:^{
        
        // Mover o botão para baixo
        self.button.frame = CGRectMake(self.button.frame.origin.x,
                                       self.button.frame.origin.y + 100,
                                       self.button.frame.size.width,
                                       self.button.frame.size.height);
    }];
}

@end
