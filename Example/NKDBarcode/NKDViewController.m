//
//  NKDViewController.m
//  NKDBarcode
//
//  Created by jinyuyoulong on 03/28/2020.
//  Copyright (c) 2020 jinyuyoulong. All rights reserved.
//

#import "NKDViewController.h"
#import "UIImage-NKDBarcode.h"
#import "NKDCode128Barcode.h"

@interface NKDViewController ()

@end

@implementation NKDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //    用法示例 Demo
    CGSize size = CGSizeMake(300, 300);
    UIImage *imgQR = [NKDViewController qrImageWithString:@"1234567890"
               size:size
              color:[UIColor blackColor]
    backGroundColor:[UIColor whiteColor]];
    
    CGSize size2 =CGSizeMake(300, 100);
    UIImage *imgBarCode = [NKDViewController generateBarCode:@"1234567890"
                                                        size:size2
                                                       color:[UIColor blackColor]
                                             backGroundColor:[UIColor whiteColor]];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, size.width, size.height)];
    [self.view addSubview:imgV];
    imgV.image = imgQR;
    
    UIImageView *imgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 600, size2.width, size2.height)];
    [self.view addSubview:imgV2];
    imgV2.image = imgBarCode;
}


+ (UIImage *)qrImageWithString:(NSString *)string size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor
{
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    if (!qrFilter)
    {
        NSLog(@"Error: Could not load filter");
        return nil;
    }
    
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    CIFilter * colorQRFilter = [CIFilter filterWithName:@"CIFalseColor"];
    [colorQRFilter setValue:qrFilter.outputImage forKey:@"inputImage"];
    //二维码颜色
    if (color == nil) {
        color = [UIColor blackColor];
    }
    if (backGroundColor == nil) {
        backGroundColor = [UIColor whiteColor];
    }
    [colorQRFilter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor0"];
    //背景颜色
    [colorQRFilter setValue:[CIColor colorWithCGColor:backGroundColor.CGColor] forKey:@"inputColor1"];
    
    
    CIImage *outputImage = [colorQRFilter valueForKey:@"outputImage"];
    
    UIImage *smallImage = [self imageWithCIImage:outputImage orientation: UIImageOrientationUp];
    
    return [self resizeImageWithoutInterpolation:smallImage size:size];
}


+ (UIImage *)generateBarCode:(NSString *)code size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor
{
//    @available(iOS 7, *) 可用性
//    iOS7以下
    if ([UIDevice currentDevice].systemVersion.floatValue < 8) {
        UIImage * barcodeIamge = [UIImage imageFromBarcode:[[NKDCode128Barcode alloc] initWithContent:code printsCaption:NO]];
        return barcodeIamge;
    }
    // 生成条形码图片
    CIImage *barcodeImage;
    NSData *data = [code dataUsingEncoding:NSASCIIStringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:[NSNumber numberWithFloat:7.0] forKey:@"inputQuietSpace"];

    //设置条形码颜色和背景颜色
    CIFilter * colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    [colorFilter setValue:filter.outputImage forKey:@"inputImage"];

    //条形码颜色
    if (color == nil) {
        color = [UIColor blackColor];
    }
    if (backGroundColor == nil) {
        backGroundColor = [UIColor whiteColor];
    }
    [colorFilter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor0"];
    //背景颜色
    [colorFilter setValue:[CIColor colorWithCGColor:backGroundColor.CGColor] forKey:@"inputColor1"];
    
    barcodeImage = [colorFilter outputImage];
    
    // 消除模糊
    CGFloat scaleX = size.width / barcodeImage.extent.size.width; // extent 返回图片的frame
    CGFloat scaleY = size.height / barcodeImage.extent.size.height;
    CIImage *transformedImage = [barcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    
    return [UIImage imageWithCIImage:transformedImage];
}

+ (UIImage *)resizeImageWithoutInterpolation:(UIImage *)sourceImage size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextSetInterpolationQuality(UIGraphicsGetCurrentContext(), kCGInterpolationNone);
    [sourceImage drawInRect:(CGRect){.size = size}];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)imageWithCIImage:(CIImage *)aCIImage orientation: (UIImageOrientation)anOrientation
{
    if (!aCIImage) return nil;
    
    CGImageRef imageRef = [[CIContext contextWithOptions:nil] createCGImage:aCIImage fromRect:aCIImage.extent];
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:anOrientation];
    CFRelease(imageRef);
    
    return image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
