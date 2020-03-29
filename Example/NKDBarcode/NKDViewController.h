//
//  NKDViewController.h
//  NKDBarcode
//
//  Created by jinyuyoulong on 03/28/2020.
//  Copyright (c) 2020 jinyuyoulong. All rights reserved.
//

@import UIKit;

@interface NKDViewController : UIViewController
/// 二维码生成
/// @param string 需要转换的字符串
/// @param size 图像显示大小
/// @param color 二维码颜色
/// @param backGroundColor 二维码背景色
+ (UIImage *)qrImageWithString:(NSString *)string size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor;
/// 条形码生成
/// @param code barcode
/// @param size image size
/// @param color barcode code
/// @param backGroundColor background color
+ (UIImage *)generateBarCode:(NSString *)code size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor;
@end
