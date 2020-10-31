package com.blog.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:25
 * @Version 1.0
 */
public class StringUtil {

    public static boolean isEmpty(String str) {
        return str == null || "".equals(str.trim());
    }

    public static boolean isNotEmpty(String str) {
        return (str != null) && !"".equals(str.trim());
    }

    public static List<String> filterWhite(List<String> list) {
        List<String> resultList = new ArrayList<String>();
        for (String l : list) {
            if (isNotEmpty(l)) {
                resultList.add(l);
            }
        }
        return resultList;
    }

}

