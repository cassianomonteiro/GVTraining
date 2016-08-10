//
//  InitialVC.h
//  GVTraining04
//
//  Created by Cassiano Monteiro on 17/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * Exercícios:
 * 1) Na tela de lista de repositórios, criar uma tabela com seções, onde cada seção agrupa os repositórios
 *    da mesma linguagem de programação.
 * 2) Na tela de propriedades de um repositório, tratar corretamente as propriedades de tipos diferentes de
 *    NSString (número ou booleano, por exemplo).
 * 3) Na tela de botões com scroll, fazer com que os botões inativos (que não fazem nada) façam exibir imagens
 *    diferentes na tela da imagem. Dica: passar a URL da imagem a ser exibida no prepareForSegue, e usar o mesmo
 *    segue para todos os botões.
 * 4) Na tela da imagem, implementar um UITapGestureRecognizer com 2 taps para dar zoom total e encaixar na tela
 *    alternadamente. Tomar o cuidado de fazer funcionar tanto em portrait quanto landscape.
 *
 * DESAFIOS:
 * 5) Na tela de lista de repositórios, deixar de usar o NSURLConnection que é deprecated, e usar o NSURLSession.
 * 6) Incluir um searchbar na lista de repositórios, e filtrar a lista de acordo com o digitado na searchbar.
 */

@interface InitialVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@end
