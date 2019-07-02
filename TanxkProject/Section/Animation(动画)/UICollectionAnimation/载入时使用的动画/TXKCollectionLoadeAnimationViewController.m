//
//  TXKCollectionLoadeAnimationViewController.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/127.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKCollectionLoadeAnimationViewController.h"

@interface TXKCollectionLoadeAnimationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) NSArray <NSString *>*dataSource;

@end

@implementation TXKCollectionLoadeAnimationViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"载入时使用的动画";
    self.view.backgroundColor = UIColor.whiteColor;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"开始动画" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked)];
    self.navigationController.navigationItem.rightBarButtonItem = rightItem;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self->_collectionView reloadData];
    self.dataSource = @[@"btn_edit",@"btn_edit",@"btn_edit",@"btn_edit",@"btn_edit",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
    [self->_collectionView layoutIfNeeded];
    [self animateCollection];
}

#pragma mark - Action
- (void)rightItemClicked {
    
    //增加layoutIfNeed的目的是让animateCollection在reload完成之后再执行
    [self->_collectionView reloadData];
    [self->_collectionView layoutIfNeeded];
    [self animateCollection];
}

#pragma mark - work

-(void)animateCollection{
    
    NSArray *cells = self.collectionView.visibleCells;
    CGFloat collectionHeight = self.collectionView.bounds.size.height;
    for (UICollectionViewCell *cell in cells.objectEnumerator) {
        cell.alpha = 1.0f;
        cell.transform = CGAffineTransformMakeTranslation(0, collectionHeight);
        NSUInteger index = [cells indexOfObject:cell];
        [UIView animateWithDuration:0.7f delay:0.05*index usingSpringWithDamping:0.8 initialSpringVelocity:0 options:0 animations:^{
            cell.transform =  CGAffineTransformMakeTranslation(0, 0);
        } completion:nil];
    }
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [self qmui_randomColor];
    return cell;
}

#pragma mark - other
- (UIColor *)qmui_randomColor {
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
