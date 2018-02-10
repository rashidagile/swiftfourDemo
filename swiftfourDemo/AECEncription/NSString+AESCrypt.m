//
//  NSString+AESCrypt.h
//
//  AES128Encryption + Base64Encoding
//

#import "NSString+AESCrypt.h"

@implementation NSString (AESCrypt)

- (NSString *)AES128EncryptWithKey:(NSString *)key
{
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *encryptedData = [plainData AES128EncryptWithKey:key];
    
    //NSData *encryptedData = [plainData AES256EncryptWithKey:key];
    
    
    
    
    //NSString *encryptedString = [encryptedData base64EncodedStringWithOptions:0];
    
    NSString *encryptedString = [encryptedData base64Encoding];
    
    return encryptedString;
}

-(NSString *)AES128DecryptWithKey:(NSString *)key
{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    //NSData *decodedData = [NSData alloc];
    
   // decodedData = [decodedData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
    
    //NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    //NSString* str = @"teststring";
    decodedData = [decodedData AES128DecryptWithKey:key];
    
   // decodedData = [decodedData AES256DecryptWithKey:key];
    
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}

- (NSString *) decryptString:(NSString *)ciphertext withKey:(NSString*)key
{
    
    NSData *cipherData = [[NSData alloc] initWithBase64EncodedString:ciphertext
                                                             options:0];
    NSString *plainText  = [[NSString alloc] initWithData:[cipherData AES128DecryptWithKey:key] encoding:NSUTF8StringEncoding];
    NSLog(@"decrypt AES128+base64: %@", plainText);
    
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:ciphertext options:kNilOptions];
    
    
       
    data = [data AES128DecryptWithKey:key];
    
    NSLog(@"Get Data = %@",data);
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}




@end
