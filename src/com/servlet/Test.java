package com.servlet;

import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PublicKey;
import java.security.spec.ECPoint;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.InvalidKeySpecException;
import javax.xml.bind.DatatypeConverter;
import org.bouncycastle.jce.ECNamedCurveTable;
import org.bouncycastle.jce.ECPointUtil;
import java.security.Signature;
import java.security.SignatureException;
import org.bouncycastle.jce.interfaces.ECPublicKey;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.jce.spec.ECNamedCurveParameterSpec;
import org.bouncycastle.jce.spec.ECNamedCurveSpec;

public class Test {

	// Converting publicKey byte[] to PublicKey object.
	public static PublicKey getPublicKeyFromBytes(byte[] pubKey)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		ECNamedCurveParameterSpec spec = ECNamedCurveTable.getParameterSpec("secp256r1");
		KeyFactory kf = KeyFactory.getInstance("ECDSA", new BouncyCastleProvider());
		ECNamedCurveSpec params = new ECNamedCurveSpec("secp256r1", spec.getCurve(), spec.getG(), spec.getN());
		ECPoint point = ECPointUtil.decodePoint(params.getCurve(), pubKey);
		ECPublicKeySpec pubKeySpec = new ECPublicKeySpec(point, params);
		ECPublicKey pk = (ECPublicKey) kf.generatePublic(pubKeySpec);
		return pk;
	}

	// Method for verifying if front end generated signature is valid.
	public static boolean isValidSignature(byte[] pubKey, byte[] message, byte[] signature)
			throws NoSuchAlgorithmException, NoSuchProviderException, InvalidKeyException, SignatureException,
			InvalidKeySpecException {
		Signature ecdsaVerify = Signature.getInstance("SHA256withECDSA", new BouncyCastleProvider());
		ecdsaVerify.initVerify(getPublicKeyFromBytes(pubKey));
		ecdsaVerify.update(message);
		return ecdsaVerify.verify(signature);
	}

	public static void main(String args[]) throws Exception {
		//String of public key converted in hex.
		String publickey = "047a709e4ebf852d9ecfa64421363a67564a186f7c840473ab915544c00d1476f2922d2992074098604c4392ce932d4031dfa21a5a82755c86f2261f98aaa172bb";
		byte[] pubKey = DatatypeConverter.parseHexBinary(publickey);
		
		//String of digital signature converted in hex.
		String digitalSignature = "304402201d5f7ef5702337f3ad44d44446b1a2031d1e8799fb877a102a1cdfb371dc1ece0220238f930fca0b0491d833c8bffb996aba9b83e336ed6f6751718de52b82a14acd";
		byte[] signature = DatatypeConverter.parseHexBinary(digitalSignature);
		
		//Information to be verified (username + Bid + productID)
		byte[] message = "Ne7WoRK20021".getBytes();
		
		//Validating signature. Now if signature verfied ---> ENCRYPT bid, username, productID
		// and signature and store it in database.
		 boolean veify = isValidSignature(pubKey, message, signature);
		 
	      if(veify) {
	          System.out.println("Signature verified");   
	       } else {
	          System.out.println("Signature failed");
	       }

	}
}
