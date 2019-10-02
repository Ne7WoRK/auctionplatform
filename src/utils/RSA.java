package utils;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Arrays;
import java.util.Base64;


import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class RSA {

	// Converting String of private key to PrivateKey object.
	public static PrivateKey getPrivateKeyObject()
			throws IOException, NoSuchAlgorithmException, InvalidKeySpecException {

		// DON'T CHANGE THE OUTLOOK OF PRIVATE KEY STRING.
		final String PRIVATE_KEY = "-----BEGIN PRIVATE KEY-----\n"
				+"MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDtyllWNjPVAqtG\n"
				+"V98Ko0IzFyIm0oD9HGaalIuIKOpB9j9Wdfhm8IwlBEAiGuwy2TMbEjX8mfUVdJ2Z\n"
				+"2zLgM/AkhJxVlxxmFPNEn7c5zxzzNlzZF6O7hCAGnLVVzxmY6msKMLhfyeYeVz3D\n"
				+"fFfXMoL2Bt8CrZ+JadwQnYSzXf/Ckx+UC64LAdxxXwBd/a3atUR/jXZDqGviSkXj\n"
				+"ZNkjQSvchIC0Hdh7k+XfURtVyxgTypJ834Avtw0oT5cbngxzCRjyJz8lw6dNUuTh\n"
				+"QHlL9vfDx5vahYkamA2MZ/XvO1jO55uAXyzbpv+J8ZhR3xAfQxiUrGDycCqe7phK\n"
				+"+SVa90zvAgMBAAECggEBAOdFMnZC6U529hXISMmT10LRcQnJGmMSSEh3yO14vb3B\n"
				+"vgBdZGbZ9bPa2nVRMgCSdr4RjChNpKxlaxLEukqMuTcLMvGbsqcmISPRIuc6pLF3\n"
				+"Yf5Sm5A5BNzpdQQsFH1BITIcCHZBa2p+9zc1rElEe1LFhAiazNtc9gfC69l3xtR5\n"
				+"WtUjzznElneodRM6xIOMM+VWEMCbynEzXTeB3OUZs1/0sHwBKisQf7Ayq/FsMl2Y\n"
				+"NtBbQqROq4gDqk6eQV6i8wOggb0ki/1I1fC+wQ4AUkQC9rrIP1pv1zGKEEzMZZj4\n"
				+"pgZgI9icuBzjNbuicPmUKzUY2i7FDViuzF4KHynUV6ECgYEA/YlmUHTXfNhoI9RQ\n"
				+"QeNoZFS5y93DHiCX1xGjE6/Bt5FEjV8yIFrWwdtUrEPZyELCCaJguvcW4wQlg1uH\n"
				+"5BW/9nYWEwrppUvu6Zb+xxhUgS2vz9U2thQ012ja2VGstFqHwTUJn5/EenVdfpYi\n"
				+"CmNthjJzkWGToWIH+OGUfNJQMpsCgYEA8BnI7r741+COMX3/pRGYpEUR0FE/6mex\n"
				+"L6e//IbtKXzHXOTPjFEmGZ5ZBHXqjJWQwBVl8AE2Fhjbjo9j9jibfqQF+CSohbN8\n"
				+"nN4/Pzg1K49npXkgYxqBJozOR/rs++ypf/qxpRqYaGnbDN6lwef2ASHtsUjLtx0C\n"
				+"v672PKfemj0CgYEAnA87H0MMcRhz4boKPMRRuZA9XTN/qse9LvD4RGHnB6svWyXB\n"
				+"oRDJKEJteCu7nf0ZmvyMNglp2QrwXE628rpAkuBU7hvFfa2jvbznzn03ZtxMX82K\n"
				+"A8GkVQOB0krn14vyDActiUe6lPYxOn4HLgXNoNDlOhOp36iL57JSyBJcswkCgYEA\n"
				+"qSXhMqEDekJOqntTkJzW5lNqe1HiL2choqsRS/xaNDId2UmxFe9NYhr2J3hS5vuv\n"
				+"YEMy72RLEEIu2z4VdC7pDMzND8Xzm02ZaoIAGK+mdauvnxm4QVk4x0nHQVp7ffd6\n"
				+"ahjY8bHM0TJSCb0JFZQu8RlP9OeN7NDZUOUXwB+baRkCgYAIELqmqlmnJcHbwFc0\n"
				+"S2vmVvRer+/3oHKXm+lVhK2lThwBG2D5WGgMouXdz3Wpb3WY3qp/c2uKia7Rn3eK\n"
				+"w3xzWbc+zRtS6OrrdWL7fBWQGGGD2Ts2syUdfwALDtMMD0VG5XF9lC87rDNhLFpk\n"
				+"d2rbjFKGcdJ3xQngvO8wjX9mTw==\n"
				+ "-----END PRIVATE KEY-----";

		String strip = PRIVATE_KEY.replaceAll("\\n", "").replace("-----BEGIN PRIVATE KEY-----", "")
				.replace("-----END PRIVATE KEY-----", "");
		KeyFactory kf = KeyFactory.getInstance("RSA");
		PKCS8EncodedKeySpec keySpecPKCS8 = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(strip));
		PrivateKey privKey = kf.generatePrivate(keySpecPKCS8);

		return privKey;

	}


	// You don't have to use this method. Just include it.
	public static String decrypt(byte[] data, PrivateKey privateKey) throws NoSuchPaddingException,
			NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, InvalidKeySpecException, IOException {
		
		privateKey = getPrivateKeyObject();
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		
		return new String(cipher.doFinal(data));
	}
	
	//This method is used to unseal the bids and get bid, username and signature.
	public static String decryptOne(String data)
			throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidKeySpecException, IOException {

		return decrypt(Base64.getDecoder().decode(data.getBytes()), getPrivateKeyObject());
	}

	public  String decyptPrice(String val) throws Exception {
		String encryptedString = val;
		String unseal[] =(decryptOne(encryptedString).split("/"));
		String price=unseal[0];
		return price;
	}
	public  String decyptUser(String val) throws Exception {
	String encryptedString = val;
		String unseal[] =(decryptOne(encryptedString).split("/"));
		String price=unseal[1];
		return price;
	}
}