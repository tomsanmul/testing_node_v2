
function ComprovaDNI(dni) {

    const letra = ['T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E'];
 
    if (dni == "") return(false);
    let numDNI = parseInt(dni);
    let strDNI = numDNI.toString();
    if (strDNI.length != 8) return(false);

    let calculo = numDNI % 23;
    return letra[calculo];
   
}

console.log(ComprovaDNI("38dsdr113164"));
module.exports = ComprovaDNI;
