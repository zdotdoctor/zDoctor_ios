//
//  IntroVC.m
//  zDoctor
//
//  Created by David Iskander on 11/19/16.
//  Copyright © 2016 David Iskander. All rights reserved.
//

#import "IntroVC.h"
#import "WelcomeCollectionViewCell.h"

@interface IntroVC () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *welcomeView;
@property NSMutableArray<UIImage *> *imagearray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray<UIImageView *> *indicators;
@property UIImageView *fork;


@end

@implementation IntroVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWelcomeImages];
    [self loadFork];
}


-(void)loadWelcomeImages{
    self.imagearray = [NSMutableArray new];
    for (int i = 0; i<4; i++) {
        [self.imagearray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"welcome %i",i]]];
    }
}


-(void)loadFork{
    self.indicators = [NSMutableArray new];
    self.fork = [UIImageView new];
    for (int i = 0; i<4; i++) {
        self.fork =[[UIImageView alloc] initWithFrame:CGRectMake(145 + i*23,[UIScreen mainScreen].bounds.size.height*0.85,10,10)];
        //([UIScreen mainScreen].bounds.size.width/2)+ (i*23), [UIScreen mainScreen].bounds.size.height*0.85
        //self.fork.backgroundColor = [UIColor blueColor];
        self.fork.layer.cornerRadius= 5;
        self.fork.image=[UIImage imageNamed:@"fork"];
        self.fork.tag = i;
        [self.indicators addObject:self.fork];
        [self.welcomeView addSubview:self.fork];
    }
}


// Pragma Mark - for collection view
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WelcomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    
    cell.imageView.image = self.imagearray[indexPath.row];
    //self.introductionLabel.text = self.introductionsStr[indexPath.row];
    UIImageView *fork = self.indicators[indexPath.row];
    
    for (fork in self.indicators) {
        if (fork.tag == indexPath.row) {
            fork.layer.backgroundColor = [[UIColor grayColor] CGColor];
        } else {
            fork.layer.backgroundColor = [[UIColor blackColor] CGColor];
        }
    }
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imagearray.count;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
