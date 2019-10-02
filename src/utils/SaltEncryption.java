package utils;
import java.io.IOException;
import java.util.Date;
import java.util.Random;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;


/* To get rid of the warnings for libraries please follow the instructions bellow.
 
 1.  In Eclipse, I clicked on Window/Preferences/Java/Compiler/(Errors/Warnings)
 
 2.  On top of display click on ‘Configure Project Specific Settings) then select your current project name
 
 3.  Tick the box at the top - Enable project specific settings.
 
 4.  Then select Deprecated and restricted API
 
 5.  Then in ” Forbidden reference (access rules) ” switch from Error to Warning.
 
 6.  Click Okay.
 
 */
public class SaltEncryption {
 
    private static Random rand = new Random((new Date()).getTime());
 
    public String encrypt(String str) {
 
  BASE64Encoder encoder = new BASE64Encoder();
 
  byte[] salt = new byte[8];
 
  rand.nextBytes(salt);
 
  return encoder.encode(salt) + encoder.encode(str.getBytes());
    }
 
    public String decrypt(String encstr) {
 
  if (encstr.length() > 12) {
 
String cipher = encstr.substring(12);
 
BASE64Decoder decoder = new BASE64Decoder();
 
try {
 
    return new String(decoder.decodeBuffer(cipher));
 
} catch (IOException e) {
 
    //  throw new InvalidImplementationException(
 
    //Fail
 
}
 
  }
 
  return null;
    }
}