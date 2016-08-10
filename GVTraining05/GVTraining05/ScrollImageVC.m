//
//  ScrollImageVC.m
//  GVTrainning05
//
//  Created by Cassiano Monteiro on 28/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "ScrollImageVC.h"

@interface ScrollImageVC () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ScrollImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadImage];
}

- (void)loadImage
{
    [self.activityIndicator startAnimating];
    
    // Rodar em background
    dispatch_async(dispatch_queue_create("imageDownload", nil), ^{
        
        NSURL *imageUrl = [NSURL URLWithString:@"http://dotageeks.com/wp-content/uploads/2015/10/World-Of-Warcraft-Wallpaper-10.jpg"];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
        self.imageView = [[UIImageView alloc] initWithImage:image];
        
        // Importante informar ao scrollview qual será o seu tamanho total a englobar todo o seu conteúdo,
        // de forma que ele possa fazer o scroll. Isto é o content size.
        self.scrollView.contentSize = self.imageView.bounds.size;
        
        // Para fazer o zoom, deve-se informar as escalas máxima e mínima para o zoom.
        // Neste caso, a escala mínima será a escala de forma a encaixar a imagem na largura do frame do scrollview.
        // Estava dando errado porque a divisão estava ao contrário, causando uma escala mínima maior do que 1.
        CGFloat minScale = self.scrollView.frame.size.width / self.imageView.bounds.size.width;
        self.scrollView.minimumZoomScale = minScale;
        
        // A escala máxima será o tamanho natural da imagem. Pode-se colocar maior também.
        self.scrollView.maximumZoomScale = 1.f;
        
        // Rodar novamente na main thread para atualizar a view
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.scrollView addSubview:self.imageView];
            [self.activityIndicator stopAnimating];
        });
        
    });
}

// Para o zoom no scrollview, é necessário informar ao scrollview qual é a view de seu conteúdo que sofrerá os efeitos do zoom.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (IBAction)backTapped:(UIBarButtonItem *)sender
{
    // Isto faz com que a tela atual desapareça (é eliminada da stack)
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
