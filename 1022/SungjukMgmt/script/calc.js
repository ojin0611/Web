function calc(){
    for(var i = 0 ; i < array.length; i++){
        var student = array[i];
        var tot = student.getKor() + student.getEng() + student.getMat();
        var avg = tot / 3.;
        var grade = (avg >= 90) ? 'A' : 
                        (avg >= 80) ? 'B' :
                            (avg >= 70) ? 'C' :
                                (avg >= 60) ? 'D' : 'F';
        student.setTot(tot);
        student.setAvg(avg);
        student.setGrade(grade);
    }
    if(array.length > 1){
        document.myform.btnSort.disabled = false;
    }
}