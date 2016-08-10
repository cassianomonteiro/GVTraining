//
//  RepoDetailTVC.m
//  GVTrainning05
//
//  Created by Cassiano Monteiro on 28/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "RepoDetailTVC.h"
#import "OwnerCell.h"

@interface RepoDetailTVC ()
@end

@implementation RepoDetailTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.repoDetails[@"name"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // O número de linhas corresponderá ao número de propriedades no dicionário
    return self.repoDetails.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    // Como o dicionário não é ordenado, será utilizado o índice do array de chaves do dicionário (allKeys)
    NSString *key = self.repoDetails.allKeys[indexPath.row];
    
    // Para owner, é criada a célula customizada
    if ([key isEqualToString:@"owner"]) {
        
        OwnerCell *ownerCell = [tableView dequeueReusableCellWithIdentifier:@"OwnerCell"];
        NSDictionary *properties = self.repoDetails[key];
        ownerCell.ownerName.text = properties[@"login"];
        
        // Necessário carregar a imagem da célula de maneira assíncrona, para não travar o scroll da tableview.
        dispatch_async(dispatch_queue_create("imageDownload", nil), ^{
            
            NSString *urlString = properties[@"avatar_url"];
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            
            // Atualizar a imagem da célula na main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                ownerCell.ownerAvatar.image = image;
            });
        });
        
        cell = ownerCell;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RepoPropertyCell" forIndexPath:indexPath];
        cell.textLabel.text = key;
        cell.detailTextLabel.text = [self.repoDetails[key] description];
    }
    
    return cell;
}

// É necessário informar a altura correta das células para que a célula customizada seja exibida corretamente.
// Removi o array de tamanhos porque ele estava sendo chamado antes de criar a célula, e por isso dava conflito de constraints
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.repoDetails.allKeys[indexPath.row];
    
    if ([key isEqualToString:@"owner"]) {
        return 81.f;
    }
    else {
        return 44.f;
    }
}

@end
