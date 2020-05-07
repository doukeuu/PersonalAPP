//
//  String+Extension.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/11/23.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    /// 字符串的MD5值
    func md5Value() -> String {
        let cStr = Array(utf8)
        let len = Int(CC_MD5_DIGEST_LENGTH)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_MD5(cStr, CC_LONG(strlen(self)), buffer)
        var result = String()
        for i in 0..<len {
            result += String(format: "%02x", buffer[i])
        }
        buffer.deallocate()
        return result.uppercased()
    }
    
    /// 将手机号、身份证号中间的数字用星号代替
    func replaceNumberWithAsterisk() -> String {
        let length = self.count
        let startIndex = self.startIndex
        var range: Range<String.Index>
        if length < 3 {
            return self
        }
        if length == 11 {
            range = self.index(startIndex, offsetBy: 3)..<self.index(startIndex, offsetBy: 7)
            return self.replacingCharacters(in: range, with: "****")
        }
        if length == 15 {
            range = self.index(startIndex, offsetBy: 6)..<self.index(startIndex, offsetBy: 12)
            return self.replacingCharacters(in: range, with: "******")
        }
        if length == 18 {
            range = self.index(startIndex, offsetBy: 6)..<self.index(startIndex, offsetBy: 14)
            return self.replacingCharacters(in: range, with: "********")
        }
        let begin = length / 3
        let offset = length / 3 * 2 + length % 3
        var asteriskString = ""
        for _ in begin..<offset {
            asteriskString += "*"
        }
        range = self.index(startIndex, offsetBy: begin)..<self.index(startIndex, offsetBy: offset)
        return self.replacingCharacters(in: range, with: asteriskString)
    }
    
}
