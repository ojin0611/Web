function sort(){
    //선택정렬
    for(var i = 0 ; i < array.length - 1 ; i++){
        for(var j = i + 1 ; j < array.length ; j++){
            if(array[i].getTot() < array[j].getTot()){
                var temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    output();
}