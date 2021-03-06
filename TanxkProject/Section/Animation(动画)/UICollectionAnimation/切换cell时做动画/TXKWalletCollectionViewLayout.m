//
//  TXKWalletCollectionViewLayout.m
//  TanxkProject
//
//  Created by 檀小康 on 2019/8/21.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKWalletCollectionViewLayout.h"

@implementation TXKWalletCollectionViewLayout

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray * attributes = [[NSMutableArray alloc]init];
    //遍历设置每个item的布局属性
    for (int i=0; i<[self.collectionView numberOfItemsInSection:0]; i++) {
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建一个item布局属性类
    UICollectionViewLayoutAttributes * atti = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //获取item的个数
//    int itemCounts = (int)[self.collectionView numberOfItemsInSection:0];
    //设置每个item的大小为260*100
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height/6;
    
    if (indexPath.row == 0) {
        height = height*2;
    }
    atti.frame = CGRectMake(0, indexPath.row*height, [UIScreen mainScreen].bounds.size.width, height);
    
//    atti.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2+self.collectionView.contentOffset.y);
//    CATransform3D tran3d = CATransform3DIdentity;
//    tran3d.m34 = -1/2000.0;
//    CGFloat radius = 50/tanf(M_PI*2/itemCounts/2);
//    //     CGFloat angle = (float)(indexPath.row)/itemCounts*M_PI*2;
//    //获取当前的偏移量
//    float offset = self.collectionView.contentOffset.y;
//    //在角度设置上，添加一个偏移角度
//    float angleOffset = offset/self.collectionView.frame.size.height;
//    CGFloat angle = (float)(indexPath.row+angleOffset-1)/itemCounts*M_PI*2;
//    tran3d = CATransform3DRotate(tran3d, angle, 1.0, 0, 0);
//    tran3d = CATransform3DTranslate(tran3d, 0, 0, radius);
//    //进行设置
//    atti.transform3D = tran3d;
    return atti;
}


//-(CGSize)collectionViewContentSize{
//    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height*([self.collectionView numberOfItemsInSection:0]+2));
//}

//返回yes，则一有变化就会刷新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
    
}
@end
