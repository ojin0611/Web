function output(){
    var str = '';
    for(var i = 0 ; i < array.length ;i++){
        str += array[i].toString();
    }
    document.querySelector('#result').innerHTML = str;
}