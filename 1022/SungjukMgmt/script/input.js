function input(f){
    var student = new Student(f.hakbun.value, f.name.value, 
                        parseInt(f.kor.value), 
                        parseInt(f.eng.value),
                        parseInt(f.mat.value));
    array.push(student);
    f.hakbun.value = "";
    f.name.value = "";
    f.kor.value = "";
    f.eng.value = "";
    f.mat.value = "";
    f.hakbun.focus();
    document.querySelector('#count').innerHTML = array.length;
    if(array.length > 0) {
        document.myform.btnCalc.disabled = false;
        document.myform.btnOutput.disabled = false;
    }
}