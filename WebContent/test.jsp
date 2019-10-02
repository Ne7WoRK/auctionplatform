<script language="JavaScript" type="text/javascript" src="js/jsrsasign-all-min.js"></script>
<script>

//Generating Keys Using ECDSA
 
//Curve secp256r1 , secp256k1 , secp384r1
var curve = "secp256r1"; 
var ec = new KJUR.crypto.ECDSA({"curve": curve});

//Generating Keypair
var keypair = ec.generateKeyPairHex();

//Generating Private Key
var private_key = keypair.ecprvhex;

//Generating Public Key
var public_key = keypair.ecpubhex;

//Signature Algorithm SHA256withECDSA, SHA1withECDSA  
var signature_algo = "SHA256withECDSA";

//Message for encrypting
var msg = "Ne7WoRK"+"200"+"23";


//Printing Result in Console
document.write("Private Key : "+private_key+"<br>");
document.write("Public Key : "+public_key+"<br>");
document.write("Message : " +msg+"<br>");

//Generating Signature
var sig = new KJUR.crypto.Signature({"alg": signature_algo});
sig.init({d: private_key, curve: curve});
sig.updateString(msg);
var sigValueHex = sig.sign();
  
//Printing Signature  
document.write("Signature : "+sigValueHex+"<br>");
 
 
//Verifying Signature 
var sigval = sigValueHex;

var sig = new KJUR.crypto.Signature({"alg": signature_algo, "prov": "cryptojs/jsrsa"});
sig.init({xy: public_key, curve: curve});
sig.updateString(msg);
var result = sig.verify(sigval);

//Printing Verification
if (result) {
  document.write("<br>Signature : Verified");
} else {
  document.write("Signature : UnVerified");;
}
</script>