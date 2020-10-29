window.onload = function(){
    var buttons = document.getElementsByTagName('button');
    buttons[0].addEventListener('click', myclick, false);
}

function myclick(){
    history.go(-1);     /*양수 : 앞으로가기 ,   음수 : 뒤로가기 */
}