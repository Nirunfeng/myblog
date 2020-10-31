package com.blog.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:15
 * @Version 1.0
 */
public class MD5Util {

    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }

}
