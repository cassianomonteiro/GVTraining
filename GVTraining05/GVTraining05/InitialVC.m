//
//  InitialVC.m
//  GVTraining04
//
//  Created by Cassiano Monteiro on 17/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "InitialVC.h"
#import "ReposListTVC.h"

@interface InitialVC ()
@end

@implementation InitialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    if (savedUsername) {
        self.usernameTextField.text = savedUsername;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // NSUserDefaults é uma classe de persistência simples, permite salvar objetos serializáveis em um XML local, baseado em chave-valor
    [[NSUserDefaults standardUserDefaults] setObject:self.usernameTextField.text forKey:@"username"];
    
    // Isto é usado para transferir objetos entre telas durante a transição do segue.
    if ([segue.identifier isEqualToString:@"ShowUserReposSegue"]){
        ReposListTVC *reposList = segue.destinationViewController;
        reposList.username = self.usernameTextField.text;
    }
}

@end
