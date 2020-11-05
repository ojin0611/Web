window.onload = function(){
	let  form = document.forms[0];
	let deptnos = document.getElementsByName("deptno");
	deptnos[0].addEventListener('change', function(){
		form.action = "applicationdemo1.jsp";
		form.method = "GET";
		form.submit();
	}, false);
}