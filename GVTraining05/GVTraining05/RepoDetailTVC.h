//
//  RepoDetailTVC.h
//  GVTrainning05
//
//  Created by Cassiano Monteiro on 28/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoDetailTVC : UITableViewController

// Propriedade a ser preenchida quando ocorrer a transição via segue
@property (nonatomic, strong) NSDictionary<NSString *, id> *repoDetails;
@end
