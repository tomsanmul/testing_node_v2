function sum(a, b) {
    if ((isNaN(a)) || (isNaN(b))) return false;  //return false if any parameter is empty
    if (!Number(a) || !Number(b)) return false;  //return false if any parameter is char/string
    if ((a < 0) || (b < 0) ) return false;       //return false if any parameter is negative
    return a + b;
}
module.exports = sum;