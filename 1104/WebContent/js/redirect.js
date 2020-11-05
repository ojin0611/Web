window.onload = function(){
	var  form = document.forms[0];
	var searchs = document.getElementsByName("search");
	searchs[0].addEventListener('change', function(){
		form.action = "search.jsp";
		form.method = "GET";
		form.submit();
	}, false);
}