package org.news.utils;

import java.nio.charset.Charset;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

/**
 * XXTEA 加密算法
 * TEA算法每一次可以操作64bit(8byte)，采用128bit(16byte)作为key，算法采用迭代的形式，推荐的迭代轮数是64轮，最少32轮。  
 */
public class XXTEA {
	
	public static void main(String[] args){
		String data = new String("dfewofiewnfwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
		
		StringBuffer key = new StringBuffer("");
		
		for (int i=0;i<4;i++){
			key.append(KEY[i]);
		}
		
		String enrode = Encrypt(data,key.toString());
		System.out.println(enrode);
		
		System.out.println(Decrypt(enrode,key.toString()));
		
		try{
			Decrypt("dfewofiewnfwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",key.toString());
		}catch(Exception re){
			System.out.println("fail");
		}
		
	}
	
	/**
	 * 加密
	 * @param data
	 * @return 密文
	 */
	public static String Encrypt(String data){
		StringBuffer key = new StringBuffer("");
		
		for (int i=0;i<4;i++){
			key.append(KEY[i]);
		}
		
		return Encrypt(data,key.toString());
	}
	
	/**
	 * 解密
	 * @param data
	 * @return 解密成功返回明文，失败返回null
	 */
	public static String Decrypt(String data){
		String info = null;
		try{
			StringBuffer key = new StringBuffer("");
			
			for (int i=0;i<4;i++){
				key.append(KEY[i]);
			}
			
			info = Decrypt(data,key.toString());
		}catch(Exception re){
			return null;
		}
		
		return info;
	}
	
	
	private final static int[] KEY = new int[]{//加密解密所用的KEY
        0x789f5644, 0xf68bd5a3,
        0x81963ffb, 0x458fac57
    };
	
    public static String Encrypt(String data, String key) {
        return ToHexString(TEAEncrypt(
                ToLongArray(PadRight(data, MIN_LENGTH).getBytes(
                        Charset.forName("UTF8"))),
                ToLongArray(PadRight(key, MIN_LENGTH).getBytes(
                        Charset.forName("UTF8")))));
    }
 
    public static String Decrypt(String data, String key) {
        if (data == null || data.length() < MIN_LENGTH) {
            return data;
        }
        byte[] code = ToByteArray(TEADecrypt(
                ToLongArray(data),
                ToLongArray(PadRight(key, MIN_LENGTH).getBytes(
                        Charset.forName("UTF8")))));
        return new String(code, Charset.forName("UTF8"));
    }
 
    private static long[] TEAEncrypt(long[] data, long[] key) {
        int n = data.length;
        if (n < 1) {
            return data;
        }
 
        long z = data[data.length - 1], y = data[0], sum = 0, e, p, q;
        q = 6 + 52 / n;
        while (q-- > 0) {
            sum += DELTA;
            e = (sum >> 2) & 3;
            for (p = 0; p < n - 1; p++) {
                y = data[(int) (p + 1)];
                z = data[(int) p] += (z >> 5 ^ y << 2) + (y >> 3 ^ z << 4)
                        ^ (sum ^ y) + (key[(int) (p & 3 ^ e)] ^ z);
            }
            y = data[0];
            z = data[n - 1] += (z >> 5 ^ y << 2) + (y >> 3 ^ z << 4)
                    ^ (sum ^ y) + (key[(int) (p & 3 ^ e)] ^ z);
        }
 
        return data;
    }
 
    private static long[] TEADecrypt(long[] data, long[] key) {
        int n = data.length;
        if (n < 1) {
            return data;
        }
 
        long z = data[data.length - 1], y = data[0], sum = 0, e, p, q;
        q = 6 + 52 / n;
        sum = q * DELTA;
        while (sum != 0) {
            e = (sum >> 2) & 3;
            for (p = n - 1; p > 0; p--) {
                z = data[(int) (p - 1)];
                y = data[(int) p] -= (z >> 5 ^ y << 2) + (y >> 3 ^ z << 4)
                        ^ (sum ^ y) + (key[(int) (p & 3 ^ e)] ^ z);
            }
            z = data[n - 1];
            y = data[0] -= (z >> 5 ^ y << 2) + (y >> 3 ^ z << 4) ^ (sum ^ y)
                    + (key[(int) (p & 3 ^ e)] ^ z);
            sum -= DELTA;
        }
 
        return data;
    }
 
    private static long[] ToLongArray(byte[] data) {
        int n = (data.length % 8 == 0 ? 0 : 1) + data.length / 8;
        long[] result = new long[n];
 
        for (int i = 0; i < n - 1; i++) {
            result[i] = bytes2long(data, i * 8);
        }
 
        byte[] buffer = new byte[8];
        for (int i = 0, j = (n - 1) * 8; j < data.length; i++, j++) {
            buffer[i] = data[j];
        }
        result[n - 1] = bytes2long(buffer, 0);
 
        return result;
    }
 
    private static byte[] ToByteArray(long[] data) {
        List<Byte> result = new ArrayList<Byte>();
 
        for (int i = 0; i < data.length; i++) {
            byte[] bs = long2bytes(data[i]);
            for (int j = 0; j < 8; j++) {
                result.add(bs[j]);
            }
        }
 
        while (result.get(result.size() - 1) == SPECIAL_CHAR) {
            result.remove(result.size() - 1);
        }
 
        byte[] ret = new byte[result.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = result.get(i);
        }
        return ret;
    }
 
    public static byte[] long2bytes(long num) {
        ByteBuffer buffer = ByteBuffer.allocate(8).order(
                ByteOrder.LITTLE_ENDIAN);
        buffer.putLong(num);
        return buffer.array();
    }
 
    public static long bytes2long(byte[] b, int index) {
        ByteBuffer buffer = ByteBuffer.allocate(8).order(
                ByteOrder.LITTLE_ENDIAN);
        buffer.put(b, index, 8);
        return buffer.getLong(0);
    }
 
    private static String ToHexString(long[] data) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < data.length; i++) {
            sb.append(PadLeft(Long.toHexString(data[i]), 16));
        }
        return sb.toString();
    }
 
    private static long[] ToLongArray(String data) {
        int len = data.length() / 16;
        long[] result = new long[len];
        for (int i = 0; i < len; i++) {
            result[i] = new BigInteger(data.substring(i * 16, i * 16 + 16), 16)
                    .longValue();
        }
        return result;
    }
 
    private static String PadRight(String source, int length) {
        while (source.length() < length) {
            source += SPECIAL_CHAR;
        }
        return source;
    }
 
    private static String PadLeft(String source, int length) {
        while (source.length() < length) {
            source = '0' + source;
        }
        return source;
    }
 
    private static long DELTA = 2654435769L;
    public static int MIN_LENGTH = 32;
    private static char SPECIAL_CHAR = '\0';
}