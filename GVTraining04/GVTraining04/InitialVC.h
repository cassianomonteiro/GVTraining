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
 * 1) Criar mais uma tela de navegação a partir da lista de repositórios. Ao clicar em um repositório, transicionar para esta nova tela.
 * 2) Esta nova tela deve exibir uma outra UITableView, onde cada linha da tabela é uma propriedade do repositório.
 *
 * DESAFIOS:
 * 3) Na propriedade "owner" do repositório, criar uma célula diferente customizada, exibindo o nome do usuário e a imagem do avatar.
 * 4) Deixar de usar o NSURLConnection que é deprecated, e usar o NSSession.
 */

@interface InitialVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@end
