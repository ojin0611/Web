function Student(hakbun, name, kor, eng, mat){//생성자
    var hakbun = hakbun;  //private 개념
    var name = name;      //멤버변수 --> 속성property
    var kor = kor;
    var eng = eng;
    var mat = mat;
    var tot = null;  
    var avg = null;
    var grade = null;
    this.calc = function(){  //public 개념의 method
        tot = kor + eng + mat;
        avg = tot / 3.;
        grade = (avg >= 90) ? 'A' : 
                (avg >= 80) ? 'B' :
                    (avg >= 70) ? 'C' :
                        (avg >= 60) ? 'D' : 'F';
    }
    this.getTot = function(){
        return tot;
    }
    this.toString = function(){
        document.write('<ul>');
        document.write('<li>학번 : ' + hakbun + '</li>');
        document.write('<li>이름 : ' + name + '</li>');
        document.write('<li>국어 : ' + kor + '</li>');
        document.write('<li>영어 : ' + eng + '</li>');
        document.write('<li>수학 : ' + mat + '</li>');
        document.write('<li>총점 : ' + tot + '</li>');
        document.write('<li>평균 : ' + avg.toFixed(1) + '</li>');
        document.write('<li>평점 : ' + grade + '</li>');
        document.write('</ul>');
    }
}