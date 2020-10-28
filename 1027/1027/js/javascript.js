window.onload = function(){
    document.getElementById('btn')
    .addEventListener('click', myclick, false);
}

function myclick(){
    var name = document.getElementById('irum').value;
    var today = new Date().toLocaleDateString();
    var jumsu = 0;
    var array = [5+6, 8-3, 7*6, 15/3, 8+6-3*2/2];
    for (var i = 1; i < 6; i++){
        var munje = document.getElementById('question' + i);
        if(munje.value == array[i-1]) jumsu++;
        else{
            wrongStyleChange(munje); 
        }
    }
    var str ='';
    str += '<div>' + name + '님이 방문한 날짜는 ' + 
            today + '이며 ' + '</div>';
    str += '<div>' + array.length + '문제 중 ' +
            jumsu + '개를 맞추셔서 </div>';
    str += '<div>' + jumsu * 20 + 
           '점이며 틀린 문제는 빨간색으로 표시했습니다.</div>';
    document.getElementById('resultarea').innerHTML = str;
    document.getElementById('resultarea').style.visibility = 'visible';
}
    

function wrongStyleChange(elem){    // 파라미터로 넘어온 것은 텍스트 박스(문제 1, 문제2 ...)
    elem.style.backgroundColor = 'red';
    elem.style.color = 'white';
    elem.style.fontWeight = '900';
}