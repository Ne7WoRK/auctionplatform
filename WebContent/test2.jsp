<html>
<head>

<!--It is very important to include the libraries in the given order-->
<script language="JavaScript" type="text/javascript" src="js/rsa.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jsbn.js"></script>
<script src="js/jsrsasign-all-min.js"></script>
<script>
/*-------------------Generate client-side keys-----------------*/
//Curve secp256r1 , secp256k1 , secp384r1
var curve = "secp256r1"; 
var ec = new KJUR.crypto.ECDSA({"curve": curve});
//Generating Keypair
var keypair = ec.generateKeyPairHex();
//Generating Private Key
var private_key = keypair.ecprvhex;
//Generating Public Key
var public_key = keypair.ecpubhex;
/*----------------------End of client side keys---------------*/
//Pass here bid and username in format bid + "/" + username + "/"
var msg = "300/aamir/";
/*---------Sealing the bid with framework public key--------*/
function SealedBid(){

//Signature Algorithm SHA256withECDSA, SHA1withECDSA  
var signature_algo = "SHA256withECDSA";

//Generating Signature
var sig = new KJUR.crypto.Signature({"alg": signature_algo});
sig.init({d: private_key, curve: curve});
sig.updateString(msg);
var sigValueHex = sig.sign();

//Storing public key in variable.Don't forget to escape the lines.DON'T TOUCH THIS VALUE FORMAT!
    var pem = "-----BEGIN PUBLIC KEY-----\
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7cpZVjYz1QKrRlffCqNC\
MxciJtKA/RxmmpSLiCjqQfY/VnX4ZvCMJQRAIhrsMtkzGxI1/Jn1FXSdmdsy4DPw\
JIScVZccZhTzRJ+3Oc8c8zZc2Reju4QgBpy1Vc8ZmOprCjC4X8nmHlc9w3xX1zKC\
9gbfAq2fiWncEJ2Es13/wpMflAuuCwHccV8AXf2t2rVEf412Q6hr4kpF42TZI0Er\
3ISAtB3Ye5Pl31EbVcsYE8qSfN+AL7cNKE+XG54McwkY8ic/JcOnTVLk4UB5S/b3\
w8eb2oWJGpgNjGf17ztYzuebgF8s26b/ifGYUd8QH0MYlKxg8nAqnu6YSvklWvdM\
7wIDAQAB\
-----END PUBLIC KEY-----";
	
	//Converting from pem to public key 
	var public_key = RSA.getPublicKey(pem);

	//Initialize the seal
	var seal = msg+sigValueHex;

	//Encrypt the seal.
	var encryptSeal = RSA.encrypt(seal,public_key);

	return encryptSeal;

}
/*---------End of sealing the bid--------------------------*/

// That will give you a string of the sealed bid.
var SealedBid = SealedBid();

/*
Now you pass to the servlet controller (Sealedbid and public_key).

Then you save in db -  SealedBid ,and public key)
*/

alert("Private Key : "+private_key);
//Printing Result in Console
document.write("Private Key : "+private_key+"<br>");
document.write("Public Key : "+public_key+"<br>");
document.write("Message : " +msg+"<br>");
document.write("EncryptedSeal: "+ SealedBid +"<br>");

</script>
</head>
</html>