var student = {
    hakbun:null,  //property
    name:null, kor:null,  eng:null,  mat:null,
    tot:null,  avg:null,  grade:null,
    set:function(hakbun, name, kor, eng, mat){  //method
        this.hakbun = hakbun;   this.name = name;  this.kor = kor;
        this.eng = eng;   this.mat = mat;
    },
    calc : function(){
        this.tot = this.kor + this.eng + this.mat;
        this.avg = this.tot / 3.;
        this.grade = (this.avg >= 90) ? 'A' : 
                        (this.avg >= 80) ? 'B' :
                            (this.avg >= 70) ? 'C' :
                                (this.avg >= 60) ? 'D' : 'F';
    },
    toString : function(){
        document.write('<ul>');
        document.write('<li>학번 : ' + this.hakbun + '</li>');
        document.write('<li>이름 : ' + this.name + '</li>');
        document.write('<li>국어 : ' + this.kor + '</li>');
        document.write('<li>영어 : ' + this.eng + '</li>');
        document.write('<li>수학 : ' + this.mat + '</li>');
        document.write('<li>총점 : ' + this.tot + '</li>');
        document.write('<li>평균 : ' + this.avg + '</li>');
        document.write('<li>평점 : ' + this.grade + '</li>');
        document.write('</ul>');
    }
}